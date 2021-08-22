import jwt

from django.test   import TestCase, Client

from users.models  import User
from spaces.models import *
from orders.models import Order, OrderStatus, Booker
from my_settings    import SECRET_KEY

# class MenuPageTest(TestCase):
#     def setUp(self):
#         Category.objects.bulk_create(
#             [Category(
#                 id    = i+1,
#                 name  = f'Category{i+1}',
#                 image = f'Image{i+1}'
#             ) for i in range(4)]
#         )

#         District.objects.bulk_create(
#             [District(
#                 id        = i+1,
#                 name      = f'District{i+1}',
#                 lattitude = i+1,
#                 longitude = i+1
#             ) for i in range(4)]
#         )

#         User.objects.create(id=1,kakao_id='qkqndudnxld', nickname="종성", email="leon1111@naver.com", point=100000)

#         Space.objects.bulk_create(
#             [Space(
#                 id          = i+1,
#                 category_id = (i//4)+1,
#                 district_id = (i%4)+1,
#                 user_id     = 1,
#                 title       = f'Title{i+1}',
#                 sub_title   = f'SubTitle{i+1}',
#                 min_count   = i+1,
#                 max_count   = 40-i,
#                 like        = 16 - abs(8-i),
#                 address     = f'Address{i+1}'
#             ) for i in range(16)]
#         )

#         Image.objects.bulk_create(
#             [Image(
#                 id       = i+1,
#                 space_id = i+1,
#                 image    = f'Image{i+1}'
#             ) for i in range(16)]
#         )
#         Option.objects.bulk_create(
#             [Option(
#                 id       = i+1,
#                 space_id = (i//3)+1,
#                 option   = "day" if i%3==0 else "night" if i%3==1 else "all",
#                 price    = 16000 - 1000*abs(5 - (i//3))
#             ) for i in range(48)]
#         )
        
#         OrderStatus.objects.create(id = 1, name = "WAITING")
#         OrderStatus.objects.create(id = 2, name = "COMPLETED")

#         Booker.objects.create(id = 1, name = "종성", phone_number = "01038902027", email = "leon1111@naver.com")

#         Order.objects.create(id=1, count=6, date="2021-08-20", booker_id=1, option_id=15, space_id=5, status_id=2, user_id=1)
#         Order.objects.create(id=2, count=6, date="2021-08-20", booker_id=1, option_id=16, space_id=6, status_id=2, user_id=1)
#         Order.objects.create(id=3, count=6, date="2021-08-20", booker_id=1, option_id=17, space_id=6, status_id=2, user_id=1)
#         Order.objects.create(id=4, count=6, date="2021-08-20", booker_id=1, option_id=20, space_id=7, status_id=2, user_id=1)

#         Facility.objects.bulk_create(
#             [Facility(
#                 id   = i+1,
#                 name = f'Facilitiy{i+1}'
#             ) for i in range(4)]
#         )

#         for i in range(4):
#             Facility.objects.get(id=i+1).space.add(Space.objects.get(id=i+1))
        
#     def tearDown(self):
#         Facility.objects.all().delete()
#         Order.objects.all().delete()    
#         Booker.objects.all().delete()
#         OrderStatus.objects.all().delete()
#         Option.objects.all().delete()
#         Image.objects.all().delete()
#         Space.objects.all().delete()
#         User.objects.all().delete()
#         District.objects.all().delete()
#         Category.objects.all().delete()

#     def test_category_district_menu_get_view(self):
#         client       = Client()
#         response     = client.get('/spaces', {'category' : 1, 'district' : 1})

#         self.assertEqual(response.json(),
#         {
#             "RESULT": [
#                     {
#                         "id"        : 1,
#                         "address"   : "Address1",
#                         "title"     : "Title1",
#                         "sub_title" : "SubTitle1",
#                         "district"  : "District1",
#                         "price"     : "11000.00",
#                         "max_count" : 40,
#                         "image"     : ["Image1"],
#                         "like"      : 8
#                     }
#                 ] 
#         })
#         self.assertEqual(response.status_code, 200)

#     def test_count_date_filter_menu_get_view(self):
#         client      = Client()
#         response    = client.get('/spaces', {'category' : 2,'count' : 8, 'date' : '2021-08-20'})

#         self.assertEqual(response.json(),
#         {
#             "RESULT" : [
#                     {
#                         "id"        : 8,
#                         "address"   : "Address8",
#                         "title"     : "Title8",
#                         "sub_title" : "SubTitle8",
#                         "district"  : "District4",
#                         "price"     : "14000.00",
#                         "max_count" : 33,
#                         "image"     : ["Image8"],
#                         "like"      : 15
#                     },
#                     {
#                         "id"        : 7,
#                         "address"   : "Address7",
#                         "title"     : "Title7",
#                         "sub_title" : "SubTitle7",
#                         "district"  : "District3",
#                         "price"     : "15000.00",
#                         "max_count" : 34,
#                         "image"     : ["Image7"],
#                         "like"      : 14
#                     }
#                 ] 
#         })
#         self.assertEqual(response.status_code, 200)

#     def test_desc_order_menu_get_view(self):
#         self.maxDiff = None
#         client = Client()
#         response = client.get('/spaces', {'category' : 2,'count' : 8, 'date' : '2021-08-20', "order" : "desc"})
#         self.assertEqual(response.json(),
#         {
#             "RESULT": [
#                     {
#                         "id"        : 7,
#                         "address"   : "Address7",
#                         "title"     : "Title7",
#                         "sub_title" : "SubTitle7",
#                         "district"  : "District3",
#                         "price"     : "15000.00",
#                         "max_count" : 34,
#                         "image"     : ["Image7"],
#                         "like"      : 14
#                     },
#                     {
#                         "id"        : 8,
#                         "address"   : "Address8",
#                         "title"     : "Title8",
#                         "sub_title" : "SubTitle8",
#                         "district"  : "District4",
#                         "price"     : "14000.00",
#                         "max_count" : 33,
#                         "image"     : ["Image8"],
#                         "like"      : 15
#                     }
#                 ]
#         })
#         self.assertEqual(response.status_code, 200)

# class DistrcitTest(TestCase):
#     def setUp(self):
#         District.objects.bulk_create(
#             [District(
#                 id        = i+1,
#                 name      = f'District{i+1}',
#                 lattitude = i+1,
#                 longitude = i+1
#             ) for i in range(4)]
#         )
    
#     def tearDown(self):
#         District.objects.all().delete()

#     def test_district_view(self):
#         client       = Client()
#         response     = client.get('/spaces/district')

#         self.assertEqual(response.json(),
#         {
#             "RESULT": [
#                     {
#                         "id"       : 1,
#                         "name"     : "District1",
#                         "lattitude": "1.000000",
#                         "longitude": "1.000000"
#                     },
#                     {
#                         "id"       : 2,
#                         "name"     : "District2",
#                         "lattitude": "2.000000",
#                         "longitude": "2.000000"
#                     },
#                     {
#                         "id"       : 3,
#                         "name"     : "District3",
#                         "lattitude": "3.000000",
#                         "longitude": "3.000000"
#                     },
#                     {
#                         "id"       : 4,
#                         "name"     : "District4",
#                         "lattitude": "4.000000",
#                         "longitude": "4.000000"
#                     }
#             ]
#         })
#         self.assertEqual(response.status_code, 200)

# class CategoryTest(TestCase):
#     def setUp(self):
#         Category.objects.bulk_create(
#             [Category(
#                 id    = i+1,
#                 name  = f'Category{i+1}',
#                 image = f'Image{i+1}'
#             ) for i in range(4)]
#         )

#     def tearDown(self):
#         Category.objects.all().delete()
    
#     def test_category_success_view(self):
#         client       = Client()
#         response     = client.get('/spaces/category')

#         self.assertEqual(response.json(),
#         {
#             "RESULT": [
#                     {
#                         "id"       : 1,
#                         "name"     : "Category1",
#                         "image"    : "Image1"
#                     },
#                     {
#                         "id"       : 2,
#                         "name"     : "Category2",
#                         "image"    : "Image2"
#                     },
#                     {
#                         "id"       : 3,
#                         "name"     : "Category3",
#                         "image"    : "Image3"
#                     },
#                     {
#                         "id"       : 4,
#                         "name"     : "Category4",
#                         "image"    : "Image4"
#                     }
#             ]
#         })
#         self.assertEqual(response.status_code, 200)

class HostPostTest(TestCase):
    @classmethod
    def setUpClass(cls):
        User.objects.create(
            kakao_id = '140327275127424',
            nickname = 'jang',
            email = 'test@naver.com'
        )
        Category.objects.create(
            name = 'test',
            image = 'test.jpg'
        )
        District.objects.create(
            name = 'test',
            lattitude = 1,
            longitude = 1
        )
        Facility.objects.create(
            name = 'test',
            image = 'test.jpg'
        )
        cls.token = jwt.encode({'id' :User.objects.get(id=1).id}, SECRET_KEY, algorithm='HS256')

    @classmethod
    def tearDownClass(cls):
        User.objects.all().delete()
        Category.objects.all().delete()
        District.objects.all().delete()
        Facility.objects.all().delete()
        Space.objects.all().delete()

    # def test_hostpost_view_success(self):
    #     client = Client()
    #     data = {
    #         'category'   : 1,
    #         'title      ': 'test',
    #         'sub_title'  : 'test',
    #         'max_count'  : 4,
    #         'address'    : '서울 강남구',
    #         'image'      : ['room1.jpg'],
    #         'price_day'  : 1,
    #         'price_night': 1,
    #         'price_all'  : 1,
    #         'facility'   : ['1']
    #     }
    #     header = {'HTTP_Authorization' : self.token}
    #     response = client.post('/spaces/host', data ,ContentType='multipart/form-data', **header)
    #     self.assertEqual(response.status_code,200)
    #     self.assertEqual(response.json(),{'message':'success'})

    def test_hostpost_view_key_error(self):
        client = Client()
        data = {}
        header = {'HTTP_Authorization' : self.token}
        response = client.post('/spaces/host', data, ContentType='multipart/form-data', **header)
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(),{'message':'Key_Error'}) 

# class ProductDetailViewTest(TestCase):
#     @classmethod
#     def setUpClass(cls):
#         user = User.objects.create(
#             kakao_id = '140327275127424',
#             nickname = 'jang',
#             email = 'test@naver.com'
#         )
#         Category.objects.create(
#             name = 'test',
#             image = 'test.jpg'
#         )
#         District.objects.create(
#             name = 'test',
#             lattitude = 1,
#             longitude = 1
#         )
#         Facility.objects.create(
#             name = 'test',
#             image = 'test.jpg'
#         )
#         space = Space.objects.create(
#             user        = user,
#             category_id = 1,
#             district_id = 1,
#             title       = 'test',
#             sub_title   = 'test',
#             min_count   = 1,
#             max_count   = 1,
#             address     = 'test',
#             lattitude   = 1,
#             longitude   = 1,
#             like        = 0
#             )
#         Image.objects.bulk_create([
#             Image(space_id=1, image='image/room1.jpg')
#         ])
#         Option.objects.bulk_create([
#             Option(space_id=1, option='day', price=1),
#             Option(space_id=1, option='night', price=1),
#             Option(space_id=1, option='all', price=1)
#         ])
#         space.facility.add(Facility.objects.get(id=1))
    
    def test_category_success_view(self):
        client       = Client()
        response     = client.get('/spaces/category')

        self.assertEqual(response.json(),
        {
            "RESULT": [
                    {
                        "id"       : 1,
                        "name"     : "Category1",
                        "image"    : "Image1"
                    },
                    {
                        "id"       : 2,
                        "name"     : "Category2",
                        "image"    : "Image2"
                    },
                    {
                        "id"       : 3,
                        "name"     : "Category3",
                        "image"    : "Image3"
                    },
                    {
                        "id"       : 4,
                        "name"     : "Category4",
                        "image"    : "Image4"
                    }
            ]
        })
        self.assertEqual(response.status_code, 200)

class HostPostTest(TestCase):
    @classmethod
    def setUpClass(cls):
        user = User.objects.create(
            kakao_id = '140327275127424',
            nickname = 'jang',
            email = 'test@naver.com'
        )
        Category.objects.create(
            name = 'test',
            image = 'test.jpg'
        )
        District.objects.create(
            name = 'test',
            lattitude = 1,
            longitude = 1
        )
        Facility.objects.create(
            name = 'test',
            image = 'test.jpg'
        )
        cls.token = jwt.encode({'id' :user.id}, SECRET_KEY, algorithm='HS256')
    
    @classmethod
    def tearDownClass(cls):
        User.objects.all().delete()
        Category.objects.all().delete()
        District.objects.all().delete()
        Facility.objects.all().delete()
        Space.objects.all().delete()

    def test_hostpost_view_success(self):
        client = Client()
        data = {
            'category'   : 1,
            'district'   : 1,
            'title      ': 'test',
            'sub_title'  : 'test',
            'min_count'  : 1,
            'max_count'  : 2,
            'address'    : 'test',
            'lattitude'  : 1,
            'longitude'  : 1,
            'like'       : 0,
            'image'      : ['https://ourspace.s3.ap-northeast-2.amazonaws.com/static/image/room1.jpg'],
            'price_day'  : 1,
            'price_night': 1,
            'price_all'  : 1,
            'facility'   : ['1']
        }
        header = {'HTTP_Authorization' : self.token}
        response = client.post('/space/host', data ,ContentType='multipart/form-data', **header)
        self.assertEqual(response.status_code,200)
        self.assertEqual(response.json(),{'message':'success'})

    def test_hostpost_view_key_error(self):
        client = Client()
        data = {
            'category'   : 1,
            'district'   : 1,
        }
        header = {'HTTP_Authorization' : self.token}
        response = client.post('/space/host', data, ContentType='multipart/form-data', **header)
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(),{'message':'Key_Error'})

#     @classmethod
#     def tearDownClass(cls):
#         User.objects.all().delete()
#         Category.objects.all().delete()
#         District.objects.all().delete()
#         Facility.objects.all().delete()
#         Space.objects.all().delete()
#         Option.objects.all().delete()

#     def test_product_detail_view_success(self):
#         client = Client()

#         response = client.get('/space/detail/1')
#         self.assertEqual(response.status_code, 200)
#         self.assertEqual(response.json(),
#         {'results':[{
#             'id'         : 1,
#             'category_id': 1,
#             'district_id': 1,
#             'image'      : ['/image/room1.jpg'],
#             'title'      : 'test',
#             'sub_title'  : 'test',
#             'min_count'  : 1,
#             'max_count'  : 1,
#             'address'    : 'test',
#             'lattitude'  : '1.000000',
#             'longitude'  : '1.000000',
#             'like'       : 0,
#             'price'      : {
#                 'day'  : '1.00',
#                 'night': '1.00',
#                 'all'  : '1.00'
#             },
#             'facility' : [{
#                 'id'   : 1,
#                 'name' : 'test',
#                 'image': '/test.jpg'
#                 }]  
#         }]})

#     def test_product_detail_view_no_space(self):
#         client = Client()

#         response = client.get('/space/detail/14')
#         self.assertEqual(response.status_code, 404)
#         self.assertEqual(response.json(), {'message':'No_Space'})

# class DateFilterViewTest(TestCase):
#     @classmethod
#     def setUpClass(cls):
#         user = User.objects.create(
#             kakao_id = '140327275127424',
#             nickname = 'jang',
#             email = 'test@naver.com'
#         )
#         Booker.objects.create(
#             name = 'test',
#             phone_number = '01012345678',
#             email = 'test@naver.com'
#         )
#         Category.objects.create(
#             name = 'test',
#             image = 'test.jpg'
#         )
#         District.objects.create(
#             name = 'test',
#             lattitude = 1,
#             longitude = 1
#         )
#         Facility.objects.create(
#             name = 'test',
#             image = 'test.jpg'
#         )
#         space = Space.objects.create(
#             user        = user,
#             category_id = 1,
#             district_id = 1,
#             title       = 'test',
#             sub_title   = 'test',
#             min_count   = 1,
#             max_count   = 1,
#             address     = 'test',
#             like        = 0
#             )
#         Option.objects.bulk_create([
#             Option(space_id=1, option='day', price=1),
#             Option(space_id=1, option='night', price=1),
#             Option(space_id=1, option='all', price=1)
#             ])
#         OrderStatus.objects.bulk_create([
#             OrderStatus(name = 'WAITING'),
#             OrderStatus(name = 'COMPLETED')
#         ])
#         Order.objects.create(
#             count = 4,
#             date = '2021-08-22',
#             booker_id = 1,
#             option_id = 1,
#             space_id =1,
#             status_id = 2,
#             user_id = 1
#         )
#     @classmethod
#     def tearDownClass(cls):
#         User.objects.all().delete()
#         Category.objects.all().delete()
#         District.objects.all().delete()
#         Facility.objects.all().delete()
#         Space.objects.all().delete()
#         Option.objects.all().delete()

#     def test_date_filter_view_ok(self):
#         client = Client()

#         response = client.get('/spaces/detail/1/status?date=2021-08-22&option=night')
#         self.assertEqual(response.status_code, 200)
#         self.assertEqual(response.json(), {'message':'OK'})

#     def test_date_filter_view_ok_2(self):
#         client = Client()

#         response = client.get('/spaces/detail/1/status?date=2021-08-23&option=night')
#         self.assertEqual(response.status_code, 200)
#         self.assertEqual(response.json(), {'message':'OK'})

#     def test_date_filter_view_denied(self):
#         client = Client()

#         response = client.get('/spaces/detail/1/status?date=2021-08-22&option=day')
#         self.assertEqual(response.status_code, 400)
#         self.assertEqual(response.json(), {'message':'DENIED'})

#     def test_date_filter_view_denied_2(self):
#         client = Client()

#         response = client.get('/spaces/detail/1/status?date=2021-08-22&option=all')
#         self.assertEqual(response.status_code, 400)
#         self.assertEqual(response.json(), {'message':'DENIED'})
