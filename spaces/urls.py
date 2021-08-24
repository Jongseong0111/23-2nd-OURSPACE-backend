from django.urls   import path
from spaces.views  import ProductsView, DistrictView, HostView, CategoryView, ProductDetailView, DateFilterView, FacilityView, ReviewView

urlpatterns = [
    path('', ProductsView.as_view()),
    path('/district', DistrictView.as_view()),
    path('/category', CategoryView.as_view()),
    path('/host', HostView.as_view()),
    path('/facility', FacilityView.as_view()),
    path('/detail/<int:space_id>', ProductDetailView.as_view()),
    path('/detail/<int:space_id>/status', DateFilterView.as_view()),
    path('/facility', FacilityView.as_view()),
    path('/<int:space_id>/review', ReviewView.as_view()),
]