from django.urls   import path
from orders.views  import OrderView, ReserveView

urlpatterns = [
    path('', ReserveView.as_view()),
    path('/myorder', OrderView.as_view())
]