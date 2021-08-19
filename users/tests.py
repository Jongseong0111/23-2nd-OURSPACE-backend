from users.models  import User
from django.test   import TestCase, Client
from unittest.mock import patch, MagicMock

from my_settings import SECRET_KEY

class KaKaoSignInTest(TestCase):
    def setUp(self):
        User.objects.create(
            kakao_id = '140327275127424',
            nickname = 'jang',
            email = 'luv4cece@naver.com'
        )   

    def tearDown(self):
        User.objects.all().delete()

    @patch('users.views.requests')    
    def test_kakaologin_view_get_signup_success(self, mocked_requests):
        client = Client()

        class MockedResponse:
            def json(self):
                return {
                    'id': '1408384944',
                    'kakao_account': {
                    'email' : 'juri@naver.com'
                    },
                    'properties' : {
                        'nickname' : 'juri'
                    }
                }
        mocked_requests.get = MagicMock(return_value = MockedResponse())
        header              = {'HTTP_Authorization' : 'access_token'}
        response            = client.get('/users/signin/kakao', ContentType ='application/json',**header)
        self.assertEqual(response.status_code, 200)

    @patch('users.views.requests')
    def test_kakaologin_view_get_signin_success(self, mocked_requests):
        client = Client()

        class MockedResponse:
            def json(self):
                return {
                    'id': '140327275127424',
                    'kakao_account': {
                    'email' : 'luv4cece@naver.com'
                    },
                    'properties' : {
                        'nickname' : 'jang'
                    }
                }
        mocked_requests.get = MagicMock(return_value = MockedResponse())
        header              = {'HTTP_Authorization' : 'access_token'}
        response            = client.get('/users/signin/kakao', ContentType ='application/json',**header)
        self.assertEqual(response.status_code, 200)

    @patch('users.views.requests')
    def test_kakaologin_view_get_no_token(self, request):
        client   = Client()
        response = client.get('/users/signin/kakao')
        self.assertEqual(response.json(),{'message':'no_token'})
        self.assertEqual(response.status_code, 401)

    @patch('users.views.requests')
    def test_kakaologin_view_get_invalid_token(self, request):
        client = Client()

        class MockedResponse:
            def json(self):
                return {}
        request.get = MagicMock(return_value = MockedResponse())
        header      = {'HTTP_Authorization' : 'access_token'}
        response    = client.get('/users/signin/kakao', ContentType ='application/json',**header)
        self.assertEqual(response.json(), {'message':'invalid_token'})
        self.assertEqual(response.status_code, 400)