import json, jwt

from django.test                    import TestCase, Client
from django.core.files.uploadedfile import SimpleUploadedFile

from users.models  import User
from spaces.models import Category, District, Space, Option, Image, Facility
from orders.models import OrderStatus, Order, Booker

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
        Facility.objects.create(
            id=1,
            name = 'test',
            image = 'test.jpg'
        )
        User.objects.create(id=1, kakao_id='qkqndudnxld', nickname="종성", email="leon1111@naver.com", point=100000)
        User.objects.create(id=2, kakao_id='qkqndudnxld2', nickname="종성2", email="leon1112@naver.com", point=100000)
        self.token = jwt.encode({'id':User.objects.get(id=1).id}, SECRET_KEY, algorithm= 'HS256')

        space = Space.objects.create(
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
        space.facility.add(Facility.objects.get(id=1))
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
        result =  {
            "order_id"  : 2,
            "space_id"  : 1,
            "category"  : 'Category1',
            "title"     : 'Title1',
            "sub_title" : 'SubTitle1',
            "min_count" : 1,
            "max_count" : 40,
            "image"     : ['Image1'],
            "facility"  : [{"name": 'test', "image" : 'test.jpg'}],
            "count"     : 4,
            "date"      : '2021-08-26',
            "option"    : 'all',
            "price"     : '11000.00'
        }

        response = client.post('/orders?space_id=1', json.dumps(orders), content_type='application/json', **header)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(),
            {
                'RESULT':result
            }
        )

class OrderViewTest(TestCase):
    def setUp(self):
        user = User.objects.create(
            id=1,
            kakao_id = '140327275127424',
            nickname = 'jang',
            email = 'test@naver.com'
        )
        Booker.objects.create(
            id=1,
            name = 'test',
            phone_number = '01012345678',
            email = 'test@naver.com'
        )
        category = Category.objects.create(
            id=1,
            name = 'test',
            image = 'test.jpg'
        )
        District.objects.create(
            id=1,
            name = 'test',
            lattitude = 1,
            longitude = 1
        )
        Facility.objects.create(
            id=1,
            name = 'test',
            image = 'test.jpg'
        )
        Space.objects.create(
            id=1,
            user        = user,
            category    = category,
            district_id = 1,
            title       = 'test',
            sub_title   = 'test',
            min_count   = 1,
            max_count   = 1,
            address     = 'test',
            like        = 0
            )
        Image.objects.create(space_id=1, image='room1.jpg')
        Option.objects.bulk_create([
            Option(id=1,space_id=1, option='day', price=1),
            Option(id=2,space_id=1, option='night', price=1),
            Option(id=3,space_id=1, option='all', price=1)
            ])
        OrderStatus.objects.bulk_create([
            OrderStatus(id=1,name = 'WAITING'),
            OrderStatus(id=2,name = 'COMPLETED')
        ])
        Order.objects.create(
            id=1,
            count = 4,
            date = '2021-08-22',
            booker_id = 1,
            option_id = 1,
            space_id =1,
            status_id = 2,
            user_id = 1
        )
        self.token = jwt.encode({'id' :1}, SECRET_KEY, algorithm='HS256')
    def tearDown(self):
        Option.objects.all().delete()
        Space.objects.all().delete()
        Facility.objects.all().delete()
        District.objects.all().delete()
        Category.objects.all().delete()
        User.objects.all().delete()

    def test_order_view_success(self):
        client = Client()

        header = {'HTTP_Authorization' : self.token}
        response = client.get('/orders/myorder', **header)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {'results':[{
            'order_id' : 1,
            'space_id' : 1,
            'date'     : '2021-08-22',
            'title'    : 'test',
            'sub_title': 'test',
            'address'  : 'test',
            'image'    : 'room1.jpg',
            'option'   : 'day',
            'price'    : '1.00',
            'is_expired'  : True
            }]})
