from django.db import models

class User(models.Model):
    kakao_id     = models.CharField(max_length=45, unique=True)
    email        = models.CharField(max_length=200, unique=True)
    nickname     = models.CharField(max_length=200)
    point        = models.DecimalField(max_digits=10, decimal_places=2, null=True)

    class Meta:
        db_table = "users"