from django.urls   import path

from spaces.views  import FacilityView, ProductsView, DistrictView, HostView, CategoryView

urlpatterns = [
    path('', ProductsView.as_view()),
    path('/district', DistrictView.as_view()),
    path('/category', CategoryView.as_view()),
    path('/host', HostView.as_view()),
    path('/facility', FacilityView.as_view())
]