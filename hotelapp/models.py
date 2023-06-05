from django.db import models

# Create your models here.
class Accommodation(models.Model):
    顾客id = models.ForeignKey('Client', models.DO_NOTHING, db_column='顾客id')
    客房编号 = models.ForeignKey('Room', models.DO_NOTHING, db_column='客房编号')
    入住时间 = models.CharField(max_length=45, blank=True, null=True)
    id = models.IntegerField(primary_key=True)
    def __str__(self):
        return "客房订单管理"
    class Meta:
        verbose_name = "客房订单管理"
        verbose_name_plural = verbose_name
        db_table = 'accommodation'

class Client(models.Model):
    顾客相片 = models.ImageField(upload_to='Client_images/', blank=True, null=True)
    顾客id = models.AutoField(primary_key=True)
    姓名 = models.CharField(max_length=45, blank=True, null=True)
    身份证号 = models.CharField(max_length=45, blank=True, null=True)
    def __str__(self):
        return self.姓名
    class Meta:
        verbose_name = "顾客管理"
        verbose_name_plural = verbose_name
        db_table = 'client'

class Food(models.Model):
    菜品相片 = models.ImageField(upload_to='Food_images/', blank=True, null=True)
    菜品编号 = models.IntegerField(primary_key=True)
    菜名 = models.CharField(max_length=45)
    价格 = models.CharField(max_length=45)
    厨师id = models.ForeignKey('Staff', models.DO_NOTHING, db_column='厨师id')
    def __str__(self):
        return self.菜名
    class Meta:
        verbose_name = "餐厅管理"
        verbose_name_plural = verbose_name
        db_table = 'food'


class Order(models.Model):
    顾客编号 = models.ForeignKey(Client, models.DO_NOTHING, db_column='顾客编号')
    菜品编号 = models.ForeignKey(Food, models.DO_NOTHING, db_column='菜品编号')
    服务员编号 = models.ForeignKey('Staff', models.DO_NOTHING, db_column='服务员编号')
    桌号 = models.IntegerField()
    id = models.IntegerField(primary_key=True)

    class Meta:
        verbose_name = "餐厅订单管理"
        verbose_name_plural = verbose_name
        db_table = 'order'


class Park(models.Model):
    车位编号 = models.IntegerField(primary_key=True)
    当前状态 = models.CharField(max_length=45)
    车辆牌号 = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        verbose_name = "停车场管理"
        verbose_name_plural = verbose_name
        db_table = 'park'


class Room(models.Model):
    客房款式相片=models.ImageField(upload_to='Room_images/', blank=True, null=True)
    房间号 = models.IntegerField(primary_key=True)
    客房类型 = models.CharField(max_length=45)
    价格 = models.IntegerField()
    负责人编号 = models.ForeignKey('Staff', models.DO_NOTHING, db_column='负责人编号')
    def __str__(self):
        return str(self.房间号)
    class Meta:
        verbose_name = "客房信息管理"
        verbose_name_plural = verbose_name
        db_table = 'room'


class Staff(models.Model):
    员工相片 = models.ImageField(upload_to='Staff_images/', blank=True, null=True)
    员工id = models.AutoField(primary_key=True)
    姓名 = models.CharField(max_length=45)
    职务 = models.CharField(max_length=45)
    月薪 = models.CharField(max_length=45)
    工龄 = models.CharField(max_length=45)

    def __str__(self):
        return self.姓名

    class Meta:
        verbose_name = "员工信息管理"
        verbose_name_plural = verbose_name
        db_table = 'staff'


class Vip(models.Model):
    会员相片 = models.ImageField(upload_to='Vip_images/', blank=True, null=True)
    会员编号 = models.AutoField(primary_key=True)
    姓名 = models.CharField(max_length=45)
    会员等级 = models.CharField(max_length=45)
    联系方式 = models.CharField(max_length=45)

    class Meta:
        verbose_name = "会员信息管理"
        verbose_name_plural = verbose_name
        db_table = 'vip'
