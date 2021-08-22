from django.urls   import path
from orders.views  import ReserveView

urlpatterns = [
    path('', ReserveView.as_view()),
]