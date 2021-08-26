import jwt, requests, random

from django.http  import JsonResponse
from django.views import View

from users.models import User
from my_settings  import SECRET_KEY

class KakaoSignInView(View): 
    def get(self, request): 
        try:
            access_token = request.headers.get('Authorization')

            if not access_token: 
                return JsonResponse({'message':'no_token'}, status=401)

            url           = 'https://kapi.kakao.com/v2/user/me'
            response      = requests.get(url, headers={'Authorization': f'Bearer {access_token}'})
            user_response = response.json()
        
            user,created = User.objects.get_or_create(kakao_id=user_response['id'],nickname = user_response['properties']['nickname'])

            if created: 
                user.email    = user_response['kakao_account']['email']
                user.nickname = user_response['properties']['nickname']
                user.point    = random.randrange(0,10000)
                user.save()

            token = jwt.encode({'id':user.id}, SECRET_KEY, algorithm= 'HS256')
            
            return JsonResponse({'access_token':token}, status=200)
        except KeyError:
            return JsonResponse({'message':'invalid_token'}, status=400)
        