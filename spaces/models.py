from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        db_table = "categories"

class District(models.Model):
    name      = models.CharField(max_length=45)
    lattitude = models.DecimalField(max_digits=9, decimal_places=6)
    longitude = models.DecimalField(max_digits=9, decimal_places=6)

    class Meta:
        db_table = "districts"

class Facility(models.Model):
    choice = models.CharField(max_length=45)
    space  = models.ManyToManyField("Space", related_name="facility")

    class Meta:
        db_table = "facilities"

class Option(models.Model):
    space  = models.ForeignKey("Space", on_delete=models.CASCADE)
    option = models.CharField(max_length=200)
    price  = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        db_table = "options"

class Space(models.Model):
    category    = models.ForeignKey("Category", on_delete=models.CASCADE)
    district    = models.ForeignKey("District", on_delete=models.CASCADE)
    user        = models.ForeignKey("users.User", on_delete=models.CASCADE)
    title       = models.CharField(max_length=200)
    sub_title   = models.CharField(max_length=200)
    description = models.TextField()
    min_count   = models.IntegerField()
    max_count   = models.IntegerField()
    mainimage   = models.ImageField(upload_to="images")
    like        = models.IntegerField()
    lattitude   = models.DecimalField(max_digits=9, decimal_places=6)
    longitude   = models.DecimalField(max_digits=9, decimal_places=6)
    address     = models.CharField(max_length=200)

    class Meta:
        db_table = "spaces"

class Image(models.Model):
    space = models.ForeignKey("Space", on_delete=models.CASCADE)
    image = models.ImageField(upload_to="images")

    class Meta:
        db_table = "images"

class Review(models.Model):
    user      = models.ForeignKey("users.User", on_delete=models.CASCADE)
    space     = models.ForeignKey("Space", on_delete=models.CASCADE)
    image     = models.ImageField(upload_to="images")
    create_at = models.DateTimeField(auto_now_add=True)
    grade     = models.DecimalField(max_digits=4, decimal_places=2)
    content   = models.TextField()

    class Meta:
        db_table = "reviews"