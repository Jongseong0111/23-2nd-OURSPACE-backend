from django.test   import TestCase, Client

from users.models  import User
from spaces.models import Category, District, Space, Option, Facility, Image
from orders.models import Order, OrderStatus, Booker

class MenuPageTest(TestCase):
    def setUp(self):
        Category.objects.bulk_create(
            [Category(
                id    = i+1,
                name  = f'Category{i+1}',
                image = f'Image{i+1}'
            ) for i in range(4)]
        )

        District.objects.bulk_create(
            [District(
                id        = i+1,
                name      = f'District{i+1}',
                lattitude = i+1,
                longitude = i+1
            ) for i in range(4)]
        )

        User.objects.create(id=1,kakao_id='qkqndudnxld', nickname="종성", email="leon1111@naver.com", point=100000)

        Space.objects.bulk_create(
            [Space(
                id          = i+1,
                category_id = (i//4)+1,
                district_id = (i%4)+1,
                user_id     = 1,
                title       = f'Title{i+1}',
                sub_title   = f'SubTitle{i+1}',
                min_count   = i+1,
                max_count   = 40-i,
                mainimage   = f'MainImage{i+1}',
                like        = 16 - abs(8-i),
                address     = f'Address{i+1}',
                lattitude   = i+1,
                longitude   = i+1
            ) for i in range(16)]
        )

        Image.objects.bulk_create(
            [Image(
                id       = i+1,
                space_id = i+1,
                image    = f'Image{i+1}'
            ) for i in range(16)]
        )
        Option.objects.bulk_create(
            [Option(
                id       = i+1,
                space_id = (i//3)+1,
                option   = "day" if i%3==0 else "night" if i%3==1 else "all",
                price    = 16000 - 1000*abs(5 - (i//3))
            ) for i in range(48)]
        )
        
        OrderStatus.objects.create(id = 1, name = "WAITING")
        OrderStatus.objects.create(id = 2, name = "COMPLETED")

        Booker.objects.create(id = 1, name = "종성", phone_number = "01038902027", email = "leon1111@naver.com")

        Order.objects.create(id=1, count=6, date="2021-08-20", booker_id=1, option_id=15, space_id=5, status_id=2, user_id=1)
        Order.objects.create(id=2, count=6, date="2021-08-20", booker_id=1, option_id=16, space_id=6, status_id=2, user_id=1)
        Order.objects.create(id=3, count=6, date="2021-08-20", booker_id=1, option_id=17, space_id=6, status_id=2, user_id=1)
        Order.objects.create(id=4, count=6, date="2021-08-20", booker_id=1, option_id=20, space_id=7, status_id=2, user_id=1)

        Facility.objects.bulk_create(
            [Facility(
                id   = i+1,
                name = f'Facilitiy{i+1}'
            ) for i in range(4)]
        )

        for i in range(4):
            Facility.objects.get(id=i+1).space.add(Space.objects.get(id=i+1))
        
    def tearDown(self):
        Facility.objects.all().delete()
        Order.objects.all().delete()    
        Booker.objects.all().delete()
        OrderStatus.objects.all().delete()
        Option.objects.all().delete()
        Image.objects.all().delete()
        Space.objects.all().delete()
        User.objects.all().delete()
        District.objects.all().delete()
        Category.objects.all().delete()

    def test_category_district_menu_get_view(self):
        client       = Client()
        response     = client.get('/spaces', {'category' : 1, 'district' : 1})

        self.assertEqual(response.json(),
        {
            "RESULT": [
                    {
                        "id"        : 1,
                        "address"   : "Address1",
                        "title"     : "Title1",
                        "sub_title" : "SubTitle1",
                        "district"  : "District1",
                        "price"     : "11000.00",
                        "max_count" : 40,
                        "image"     : ["https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/Image1"],
                        "like"      : 8
                    }
                ] 
        })
        self.assertEqual(response.status_code, 200)

    def test_count_date_filter_menu_get_view(self):
        client      = Client()
        response    = client.get('/spaces', {'category' : 2,'count' : 8, 'date' : '2021-08-20'})

        self.assertEqual(response.json(),
        {
            "RESULT" : [
                    {
                        "id"        : 8,
                        "address"   : "Address8",
                        "title"     : "Title8",
                        "sub_title" : "SubTitle8",
                        "district"  : "District4",
                        "price"     : "14000.00",
                        "max_count" : 33,
                        "image"     : ["https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/Image8"],
                        "like"      : 15
                    },
                    {
                        "id"        : 7,
                        "address"   : "Address7",
                        "title"     : "Title7",
                        "sub_title" : "SubTitle7",
                        "district"  : "District3",
                        "price"     : "15000.00",
                        "max_count" : 34,
                        "image"     : ["https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/Image7"],
                        "like"      : 14
                    }
                ] 
        })
        self.assertEqual(response.status_code, 200)

    def test_desc_order_menu_get_view(self):
        self.maxDiff = None
        client = Client()
        response = client.get('/spaces', {'category' : 2,'count' : 8, 'date' : '2021-08-20', "order" : "desc"})
        self.assertEqual(response.json(),
        {
            "RESULT": [
                    {
                        "id"        : 7,
                        "address"   : "Address7",
                        "title"     : "Title7",
                        "sub_title" : "SubTitle7",
                        "district"  : "District3",
                        "price"     : "15000.00",
                        "max_count" : 34,
                        "image"     : ["https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/Image7"],
                        "like"      : 14
                    },
                    {
                        "id"        : 8,
                        "address"   : "Address8",
                        "title"     : "Title8",
                        "sub_title" : "SubTitle8",
                        "district"  : "District4",
                        "price"     : "14000.00",
                        "max_count" : 33,
                        "image"     : ["https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/Image8"],
                        "like"      : 15
                    }
                ]
        })
        self.assertEqual(response.status_code, 200)

class DistrcitTest(TestCase):
    def setUp(self):
        District.objects.bulk_create(
            [District(
                id        = i+1,
                name      = f'District{i+1}',
                lattitude = i+1,
                longitude = i+1
            ) for i in range(4)]
        )
    
    def tearDown(self):
        District.objects.all().delete()

    def test_district_view(self):
        client       = Client()
        response     = client.get('/spaces/district')

        self.assertEqual(response.json(),
        {
            "RESULT": [
                    {
                        "id"       : 1,
                        "name"     : "District1",
                        "lattitude": "1.000000",
                        "longitude": "1.000000"
                    },
                    {
                        "id"       : 2,
                        "name"     : "District2",
                        "lattitude": "2.000000",
                        "longitude": "2.000000"
                    },
                    {
                        "id"       : 3,
                        "name"     : "District3",
                        "lattitude": "3.000000",
                        "longitude": "3.000000"
                    },
                    {
                        "id"       : 4,
                        "name"     : "District4",
                        "lattitude": "4.000000",
                        "longitude": "4.000000"
                    }
            ]
        })
        self.assertEqual(response.status_code, 200)



    