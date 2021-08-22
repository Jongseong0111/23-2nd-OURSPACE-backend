from django.urls   import path
from spaces.views  import ProductsView, DistrictView

urlpatterns = [
    path('', ProductsView.as_view()),
    path('/district', DistrictView.as_view()),
]