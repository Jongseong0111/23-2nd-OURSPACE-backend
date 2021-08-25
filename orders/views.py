import json
from datetime import date

from django.http      import JsonResponse
from django.views     import View

from orders.models    import Order, OrderStatus
from users.utils      import login_decorator

class ReserveView(View):
    @login_decorator
    def post(self, request):
        try:
            space_id = request.GET.get("space_id", None)
            data     = json.loads(request.body)
                 
            if Order.objects.filter(user_id = request.user.id, status_id = OrderStatus.Status.WAITING.value).exists():
                Order.objects.filter(user_id = request.user.id, status_id = OrderStatus.Status.WAITING.value).delete()

            order = Order.objects.create(
                space_id  = space_id,
                user_id   = request.user.id, 
                status_id = OrderStatus.Status.WAITING.value, 
                date      = data['date'],
                count     = data['count'],
                option_id = data['option'],
                booker    = None
                )

            order = Order.objects.select_related('space', 'space__category', 'option')\
                                 .prefetch_related('space__facility')\
                                 .get(user_id = request.user.id, status_id = OrderStatus.Status.WAITING.value)
            result =  {
            "order_id"  : order.id,
            "space_id"  : order.space.id,
            "category"  : order.space.category.name,
            "title"     : order.space.title,
            "sub_title" : order.space.sub_title,
            "min_count" : order.space.min_count,
            "max_count" : order.space.max_count,
            "image"     : [image.image for image in order.space.image_set.all()],
            "facility"  : [{"name": facility.name, "image" : facility.image} for facility in order.space.facility.all()],
            "count"     : order.count,
            "date"      : order.date,
            "option"    : order.option.option,
            "price"     : order.option.price
        }
            return JsonResponse({'RESULT': result}, status=200)
        except KeyError:
            return JsonResponse({"MESSAGE": "KEY_ERROR"}, status=400)

class OrderView(View):
    @login_decorator
    def get(self, request):
        user      = request.user
        completed = OrderStatus.Status.COMPLETED.value
        orders    = Order.objects.filter(user=user, status_id=completed).order_by('-date')\
        .select_related('space','option')

        results = [{
            'order_id'  : order.id,
            'space_id'  : order.space.id,
            'date'      : order.date,
            'title'     : order.space.title,
            'sub_title' : order.space.sub_title,
            'address'   : order.space.address,
            'image'     : order.space.image_set.first().image,
            'option'    : order.option.option,
            'price'     : order.option.price,
            'is_expired': False if order.date > date.today() else True
            } for order in orders ]

        return JsonResponse({'results': results}, status=200)