from django.contrib import admin
from sqlalchemy import create_engine
from hotelapp.models import *

admin.site.site_header = '酒店管理系统'
admin.site.site_title = '酒店管理系统'
admin.site.index_title = '酒店管理系统'

class AccommodationAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("顾客id","客房编号","入住时间")

    '''设置过滤选项'''
    list_filter = ("顾客id","客房编号","入住时间")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

class ClientAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("顾客id","姓名","身份证号")

    '''设置过滤选项'''
    list_filter = ("顾客id","姓名","身份证号")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)



class RoomAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("房间号","客房类型","价格")

    '''设置过滤选项'''
    list_filter = ("房间号","客房类型","价格")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

admin.site.register(Accommodation, AccommodationAdmin)
admin.site.register(Client, ClientAdmin)
admin.site.register(Room, RoomAdmin)
