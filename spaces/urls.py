from django.urls   import path
from spaces.views  import ProductsView, DistrictView, CategoryView

urlpatterns = [
    path('', ProductsView.as_view()),
    path('/district', DistrictView.as_view()),
    path('/category', CategoryView.as_view()),
]