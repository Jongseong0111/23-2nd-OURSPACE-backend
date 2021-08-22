from django.http      import JsonResponse
from django.views     import View
from django.db.models import Min, Q, Count

from spaces.models    import Space, District
from orders.models    import OrderStatus

class ProductsView(View):
    def get(self, request):
        district_id  = request.GET.get('district', None)
        category_id  = request.GET.get('category', None)
        man_count    = request.GET.get('count', None)
        date         = request.GET.get('date', None)
        facilities   = request.GET.getlist('facility', None)
        order        = request.GET.get('order', None)

        prefix = {
            "desc"  : "-day_price",
            "aesc"  : "day_price",
            "best"  : "-like" 
        }
        
        q = Q()

        if district_id:
            q &= Q(district_id = district_id)

        if category_id:
            q &= Q(category_id = category_id)

        if man_count:
            q &= Q(min_count__lte = man_count) & Q(max_count__gte = man_count)

        if date:
            q_exclude = Q(order__status_id=OrderStatus.Status.COMPLETED.value) & Q(order__date=date)
            q_exclude &= ((Q(order__option__option="all") | Q(count_option = 2)))
            q &= ~q_exclude
        
        spaces = Space.objects.prefetch_related("image_set").select_related('district')\
                      .annotate(day_price=Min('option__price'), count_option = Count('order', distinct=True))\
                      .filter(q).order_by(prefix.get(order, "-like"))

        if facilities:
            for facility in facilities:
                spaces = spaces.filter(Q(facility = facility))

        result = [{
                    "id"        : space.id,
                    "address"   : space.address,
                    "title"     : space.title,
                    "sub_title" : space.sub_title,
                    "district"  : space.district.name,
                    "price"     : space.day_price,
                    "max_count" : space.max_count,
                    "image"     : [image.image.url for image in space.image_set.all()],
                    "like"      : space.like
                } for space in spaces]
            
        return JsonResponse({'RESULT':result}, status=200)

class DistrictView(View):
    def get(self, request):
        result = [{
                    "id"        : district.id,
                    "name"      : district.name,
                    "lattitude" : district.lattitude,
                    "longitude" : district.longitude 
                } for district in District.objects.all()]

        return JsonResponse({'RESULT':result}, status=200)