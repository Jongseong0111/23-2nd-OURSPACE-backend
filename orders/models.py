from django.db import models

class Order(models.Model):
    space  = models.ForeignKey("spaces.Space", on_delete=models.CASCADE)
    user   = models.ForeignKey("users.User", on_delete=models.CASCADE)
    status = models.ForeignKey("OrderStatus", on_delete=models.CASCADE)
    option = models.ForeignKey("spaces.Option", on_delete=models.CASCADE)
    booker = models.ForeignKey("Booker", on_delete=models.CASCADE)
    count  = models.IntegerField()
    date   = models.DateField()

    class Meta:
        db_table = "orders"

class Booker(models.Model):
    name          = models.CharField(max_length=45)
    phone_number  = models.CharField(max_length=200)
    email         = models.CharField(max_length=200)
    purpose       = models.CharField(max_length=200, null=True)
    content       = models.TextField(null=True)

    class Meta:
        db_table = "bookers"

class OrderStatus(models.Model):
    class Status(models.IntegerChoices):
        WAITING   = 1
        COMPLETED = 2

    name = models.CharField(max_length=100)

    class Meta:
        db_table = "statuses"