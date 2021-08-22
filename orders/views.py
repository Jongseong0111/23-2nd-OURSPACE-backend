import json

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

            Order.objects.create(
                space_id  = space_id,
                user_id   = request.user.id, 
                status_id = OrderStatus.Status.WAITING.value, 
                date      = data['date'],
                count     = data['count'],
                option_id = data['option'],
                booker    = None
                )
        
            return JsonResponse({'MESSAGE': "SUCCESS"}, status=201)

        except KeyError:
            return JsonResponse({"MESSAGE": "KEY_ERROR"}, status=400)

    @login_decorator
    def get(self, request):
        order = Order.objects.select_related('space').get(user_id = request.user.id, status_id = OrderStatus.Status.WAITING.value)

        result = {
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