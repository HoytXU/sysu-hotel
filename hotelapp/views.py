from django.shortcuts import render
from django.shortcuts import HttpResponse
from hotelapp.models import Staff
from hotelapp.models import Room
from hotelapp.models import Client
from hotelapp.models import Food
from hotelapp.models import Vip
from hotelapp.models import Park
from hotelapp.models import Order
from hotelapp.models import Accommodation
# Create your views here.

#定义展示函数
def index(request):
    return render(request, "index.html")

#员工插入函数
def insert_staff(request):
    if request.method == "POST":
        staff_id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        job = request.POST.get("job", None)
        salary = request.POST.get("salary", None)
        work_time = request.POST.get("time_work", None)
        image = request.FILES.get("image", None)  # 获取上传的图片文件

        staff = Staff.objects.create(员工id=staff_id, 姓名=name, 职务=job, 月薪=salary, 工龄=work_time)
        if image:
            staff.员工相片 = image  # 将图片文件赋值给模型的image字段

        staff.save()
    people_list = Staff.objects.all()
    return render(request, "staff.html", {"people_list":people_list})

#员工信息删除
def delete_staff(request):
    if request.method == "GET":
        staff_id = request.GET.get("id")
        Staff.objects.filter(员工id=staff_id).delete()
    return render(request, "staff.html")

#员工信息查询
def search_staff(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        staffs = eval('Staff.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'staff.html', {"staffs": staffs})

#员工信息修改
def update_staff(request):
    if request.method == "POST":
        staff_id = request.POST.get("id")
        name= request.POST.get("name")
        job = request.POST.get("job")
        salary = request.POST.get("salary")
        time = request.POST.get("time")
        
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        staff=Staff.objects.filter(员工id=staff_id).first()
        staff.员工id=staff_id
        staff.姓名=name
        staff.职务=job
        staff.员工相片=image
        staff.月薪=salary
        staff.工龄=time
        staff.save()
        return render(request, 'staff.html')

#顾客信息录入
def insert_client(request):
    if request.method == "POST":
        client_id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        identify = request.POST.get("identify", None)
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        client =Client.objects.create(顾客id=client_id, 姓名=name, 身份证号=identify)
        if image:
            client.顾客相片 = image  # 将图片文件赋值给模型的image字段

        client.save()
    people_list = Client.objects.all()
    return render(request, 'client.html', {"people_list":people_list})



#顾客信息展示
def show_client(request):
    people_list = Client.objects.all()
    return render(request, "client.html", {"people_list":people_list})

#顾客信息删除
def delete_client(request):
    if request.method == "GET":
        client_id = request.GET.get("id")
        Client.objects.filter(顾客id=client_id).delete()
    people_list = Client.objects.all()
    return render(request, 'client.html',  {"people_list":people_list})

#顾客信息修改
def update_client(request):
    if request.method == "POST":
        client_id = request.POST.get("id")
        name = request.POST.get("name")
        identify = request.POST.get("identify")
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        client = Client.objects.filter(顾客id=client_id).first()
        client.顾客id=client_id
        client.姓名=name
        client.身份证号=identify
        client.顾客相片=image
        client.save()

        people_list = Client.objects.all()
        return render(request, 'client.html',  {"people_list":people_list})



#顾客信息查询
# def search_client(request):
#     if request.method == "POST":
#         columns = request.POST.get("columns", None)
#         value = request.POST.get("value", None)
#         clients = eval('Client.objects.filter('+columns+'=' + '"'+value+'"' + ')')
#     return render(request, 'client.html', {"clients": clients})

#顾客信息查询
def search_client(request):
    clients = []  # 默认空的查询结果

    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        if columns and value:
            clients = Client.objects.filter(**{columns: value})

    return render(request, 'client.html', {"clients": clients})

#会员信息录入
def insert_vip(request):
    if request.method == "POST":
        vip_id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        rank = request.POST.get("rank", None)
        tel = request.POST.get("tel", None)
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        vip = Vip.objects.create(会员编号=vip_id, 姓名=name, 会员等级=rank, 联系方式=tel)
        if image:
            vip.会员相片 = image  # 将图片文件赋值给模型的image字段

        vip.save()
    vip_list = Vip.objects.all()
    return render(request, 'vip.html', {"vip_list": vip_list})

#会员信息删除
def delete_vip(request):
    if request.method == "GET":
        vip_id = request.GET.get("id")
        Vip.objects.filter(会员编号=vip_id).delete()
    return render(request, 'vip.html')


#会员信息修改
def update_vip(request):
    if request.method == "POST":
        vip_id = request.POST.get("id")
        name = request.POST.get("name")
        rank = request.POST.get("rank")
        tel = request.POST.get("tel")
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        vip=Vip.objects.filter(会员编号=vip_id).first()
        vip.姓名=name
        vip.会员等级=rank
        vip.会员编号=vip_id
        vip.联系方式=tel
        vip.会员相片=image
        vip.save()
        return render(request, 'vip.html')


#会员信息查询
def search_vip(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        vips = eval('Vip.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'vip.html', {"vips": vips})



#菜品信息展示/录入
def insert_food(request):
    if request.method == "POST":
        food_id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        price = request.POST.get("price", None)
        cooker = request.POST.get("cooker", None)
        cook = Staff.objects.filter(职务='厨师').get(员工id=cooker)
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        food = Food.objects.create(菜品编号=food_id, 菜名=name, 价格=price, 厨师id=cook)
        if image:
            food.菜品相片 = image  # 将图片文件赋值给模型的image字段

        food.save()
    food_list = Food.objects.all()
    return render(request, 'food.html', {"food_list": food_list})


#菜品信息删除
def delete_food(request):
    if request.method == "GET":
        food_id = request.GET.get("id")
        Food.objects.filter(菜品编号=food_id).delete()
    return render(request, 'food.html')


#菜品信息修改
def update_food(request):
    if request.method == "POST":
        food_id = request.POST.get("id")
        name = request.POST.get("name")
        price = request.POST.get("price")
        cooker = request.POST.get("cooker")
        cook = Staff.objects.filter(职务='厨师').get(员工id=cooker)
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        food=Food.objects.filter(菜品编号=food_id).first()
        food.菜品编号=food_id
        food.价格=price
        food.厨师id=cook
        food.菜名=name
        food.菜品相片=image
        food.save()
        return render(request, 'food.html')


#菜品信息查询
def search_food(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        food = eval('Food.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'food.html', {"food": food})



#停车场信息录入
def insert_park(request):
    if request.method == "POST":
        car_id = request.POST.get("id", None)
        status = request.POST.get("status", None)
        num = request.POST.get("num", None)
        print(num)
        twz = Park.objects.create(车位编号=car_id, 当前状态=status, 车辆牌号=num)
        twz.save()
    car_list = Park.objects.all()
    return render(request, 'park.html', {"car_list": car_list})


#停车场信息删除
def delete_park(request):
    if request.method == "GET":
        car_id = request.GET.get("id")
        print(car_id)
        Park.objects.filter(车位编号=car_id).delete()
    return render(request, 'park.html')


#停车信息修改
def update_park(request):
    if request.method == "POST":
        car_id = request.POST.get("id")
        status = request.POST.get("status")
        num = request.POST.get("num")
        print(car_id, status, num)
        car = Park.objects.filter(车位编号=car_id).first()
        car.当前状态=status
        car.车辆牌号=num
        car.save()
        return render(request, 'park.html')


#车位信息查询
def search_park(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        parks = eval('Park.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'park.html', {"parks": parks})


#客房信息录入
def insert_room(request):
    if request.method == "POST":
        room_id = request.POST.get("id", None)
        room_type = request.POST.get("type", None)
        price = request.POST.get("price", None)
        waiter = request.POST.get("waiter", None)
        cook = Staff.objects.filter(职务='服务员').get(员工id=waiter)
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        room = Room.objects.create(房间号=room_id, 客房类型=room_type, 价格=price, 负责人编号=cook)
        if image:
            room.客房款式相片 = image  # 将图片文件赋值给模型的image字段

        room.save()
    room_list = Room.objects.all()
    return render(request, "room.html", {"room_list": room_list})


#客房信息查询
def search_room(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        print(columns, value)
        room = eval('Room.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'room.html', {"room": room})


#客房信息删除
def delete_room(request):
    if request.method == "GET":
        room_id = request.GET.get("id")
        Room.objects.filter(房间号=room_id).delete()
    return render(request, 'room.html')


#客房信息修改
def update_room(request):
    if request.method == "POST":
        room_id = request.POST.get("id")
        room_type = request.POST.get("type")
        price = request.POST.get("price")
        waiter = request.POST.get("waiter")
        image = request.FILES.get("image", None)  # 获取上传的图片文件
        room = Room.objects.filter(房间号=room_id).first()
        room.客房类型=room_type
        room.价格=price
        room.负责人编号=Staff.objects.filter(职务='服务员').get(员工id=waiter)
        room.客房款式相片=image
        room.save()
        return render(request, 'room.html')


#菜品订单录入
def insert_order(request):
    if request.method == "POST":
        order_id = request.POST.get("id", None)
        client =request.POST.get("client",None)
        food = request.POST.get("food", None)
        waiter = request.POST.get("waiter", None)
        table = request.POST.get("table", None)
        cli = Client.objects.get(顾客id=client)
        foodid = Food.objects.get(菜品编号=food)
        cook = Staff.objects.filter(职务='服务员').get(员工id=waiter)
        twz = Order.objects.create(id=order_id, 顾客编号=cli, 菜品编号=foodid, 服务员编号=cook, 桌号=table)
        twz.save()
    order_list = Order.objects.all()
    return render(request, 'order.html', {"order_list": order_list})


#菜品订单信息删除
def delete_order(request):
    if request.method == "GET":
        order_id = request.GET.get("id")
        Order.objects.filter(id=order_id).delete()
    return render(request, 'order.html')


#菜品订单查询
def search_order(request):
    if request.method == "POST":
        order_id = request.POST.get("id", None)
        foodid = Order.objects.filter(顾客编号=order_id)
        print(foodid)
        food_id_set = []
        for f in foodid:
            fid = f.菜品编号.菜品编号
            food_id_set.append(fid)
        print(food_id_set)
        food_list = []
        for food_id in food_id_set:
            food = Food.objects.get(菜品编号=food_id)
            name = food.菜名
            price = food.价格
            li = {
                "菜名": name,
                "价格": price,
            }
            food_list.append(li)
        print(food_list)
    order_list = Order.objects.all()
    return render(request, 'order.html', {"order_list": order_list, "food_list": food_list})


#客房信息录入
def insert_accomodation(request):
    if request.method == "POST":
        aid = request.POST.get("id", None)
        client = request.POST.get("client",None)
        room = request.POST.get("room", None)
        time = request.POST.get("time", None)
        cli = Client.objects.get(顾客id=client)
        roomid = Room.objects.get(房间号=room)
        twz = Accommodation.objects.create(id=aid, 顾客id=cli, 客房编号=roomid, 入住时间=time)
        twz.save()
    acc_list = Accommodation.objects.all()   
    return render(request, 'accomodation.html', {"acc_list": acc_list})


#客房订单删除
def delete_accomodation(request):
    if request.method == "GET":
        cid = request.GET.get("id")
        Accommodation.objects.filter(id=cid).delete()
    return render(request, 'accomodation.html')

#客房订单查询
def search_accomodation(request):
    if request.method == "POST":
        cid = request.POST.get("id", None)
        accommodations = Accommodation.objects.filter(顾客id=cid)
        filter_list = []
        for acc in accommodations:
            room_id = acc.客房编号.房间号
            time = acc.入住时间
            room = Room.objects.filter(房间号=room_id).first()
            li = {
                "房间号": room_id,
                "客房类型": room.客房类型,
                "价格": room.价格,
                "入住时间": time,
            }
            filter_list.append(li)
    acc_list = Accommodation.objects.all()  
    return render(request, 'accomodation.html', {"acc_list": acc_list, "filter_list": filter_list})





