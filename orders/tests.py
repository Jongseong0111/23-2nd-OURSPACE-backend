import json, jwt

from django.test                    import TestCase, Client
from django.core.files.uploadedfile import SimpleUploadedFile

from users.models  import User
from spaces.models import Category, District, Space, Option, Image, Facility
from orders.models import OrderStatus, Order

from my_settings  import SECRET_KEY

class ReservePostViewTest(TestCase):
    def setUp(self):
        Category.objects.create(
                id    = 1,
                name  = 'Category1',
                image = 'Image1'
        )

        District.objects.create(
                id        = 1,
                name      = 'District1',
                lattitude = 1,
                longitude = 1
        )

        User.objects.create(id=1, kakao_id='qkqndudnxld', nickname="종성", email="leon1111@naver.com", point=100000)
        User.objects.create(id=2, kakao_id='qkqndudnxld2', nickname="종성2", email="leon1112@naver.com", point=100000)
        self.token = jwt.encode({'id':User.objects.get(id=1).id}, SECRET_KEY, algorithm= 'HS256')

        Space.objects.create(
                id          = 1,
                category_id = 1,
                district_id = 1,
                user_id     = 1,
                title       = 'Title1',
                sub_title   = 'SubTitle1',
                min_count   = 1,
                max_count   = 40,
                like        = 16,
                address     = f'Address1'
        )

        Image.objects.create(
                id       = 1,
                space_id = 1,
                image    = 'Image1'
        )
        Option.objects.bulk_create(
            [Option(
                id       = i+1,
                space_id = (i//3)+1,
                option   = "day" if i%3==0 else "night" if i%3==1 else "all",
                price    = 16000 - 1000*abs(5 - (i//3))
            ) for i in range(3)]
        )
        
        OrderStatus.objects.create(id=1, name = "WAITING")
        OrderStatus.objects.create(id=2, name = "COMPLETED")     
        
    def tearDown(self):
        OrderStatus.objects.all().delete()
        Option.objects.all().delete()
        Image.objects.all().delete()
        Space.objects.all().delete()
        User.objects.all().delete()
        District.objects.all().delete()
        Category.objects.all().delete()

    def test_reserve_key_error_view(self):
        client = Client()
        header = {"HTTP_Authorization" : self.token}
        orders = {
            'order_date' : '2021-08-26',
            'count'      : 4,
            'option'     : 3
        }

        response = client.post('/orders?space_id=1', json.dumps(orders), content_type='application/json', **header)

        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(),
            {
                'MESSAGE':'KEY_ERROR'
            }
        )

    def test_reserve_success_view(self):
        client = Client()
        header = {"HTTP_Authorization" : self.token}
        orders = {
            'date'   : '2021-08-26',
            'count'  : 4,
            'option' : 3
        }

        response = client.post('/orders?space_id=1', json.dumps(orders), content_type='application/json', **header)

        self.assertEqual(response.status_code, 201)
        self.assertEqual(response.json(),
            {
                'MESSAGE':'SUCCESS'
            }
        )

class ReserveGetViewTest(TestCase):
    def setUp(self):
        Category.objects.create(
                id    = 1,
                name  = 'Category1',
                image = 'Image1'
        )
        
        District.objects.create(
                id        = 1,
                name      = 'District1',
                lattitude = 1,
                longitude = 1
        )

        User.objects.create(id=1, kakao_id='qkqndudnxld', nickname="종성", email="leon1111@naver.com", point=100000)
        User.objects.create(id=2, kakao_id='qkqndudnxld2', nickname="종성2", email="leon1112@naver.com", point=100000)
        self.token = jwt.encode({'id':User.objects.get(id=2).id}, SECRET_KEY, algorithm= 'HS256')

        Space.objects.create(
                id          = 1,
                category_id = 1,
                district_id = 1,
                user_id     = 1,
                title       = 'Title1',
                sub_title   = 'SubTitle1',
                min_count   = 1,
                max_count   = 40,
                like        = 16,
                address     = f'Address1'
        )

        Image.objects.create(
                id       = 1,
                space_id = 1,
                image    =  'Image1'
        )
        
        Option.objects.bulk_create(
            [Option(
                id       = i+1,
                space_id = (i//3)+1,
                option   = "day" if i%3==0 else "night" if i%3==1 else "all",
                price    = 16000 - 1000*abs(5 - (i//3))
            ) for i in range(3)]
        )
        
        OrderStatus.objects.create(id=1, name = "WAITING")
        OrderStatus.objects.create(id=2, name = "COMPLETED")    

        Order.objects.create(
            id = 1, 
            space_id  = 1,
            user_id   = 2, 
            status_id = OrderStatus.Status.WAITING.value, 
            date      = '2021-08-26',
            count     = 4,
            option_id = 3
        ) 

        Facility.objects.create(
                id    = 1,
                name  = f'Facility{1}',
                image = 'Facility1'
        )
        
        Facility.objects.get(id=1).space.add(Space.objects.get(id=1))
        
    def tearDown(self):
        Facility.objects.all().delete()
        Order.objects.all().delete()
        OrderStatus.objects.all().delete()
        Option.objects.all().delete()
        Image.objects.all().delete()
        Space.objects.all().delete()
        User.objects.all().delete()
        District.objects.all().delete()
        Category.objects.all().delete()

    def test_order_get_view(self):
        client = Client()
        header = {"HTTP_Authorization" : self.token}
        response = client.get('/orders', **header)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(),
            {
                'RESULT' : {
                    "order_id"  : 1,
                    "space_id"  : 1,
                    "category"  : 'Category1',
                    "title"     : 'Title1',
                    "sub_title" : 'SubTitle1',
                    "min_count" : 1,
                    "max_count" : 40,
                    "image"     : ["Image1"],
                    "facility"  : [{'name':'Facility1', 'image' : 'Facility1'}],
                    "count"     : 4,
                    "date"      : '2021-08-26',
                    "option"    : 'all',
                    "price"     : '11000.00'
        }
            }
        )
