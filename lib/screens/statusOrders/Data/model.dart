class ParcelsStatusModel {
  String msg;
  Data data;

  ParcelsStatusModel({this.msg, this.data});

  ParcelsStatusModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int dealerId;
  String dealerImage;
  Null todealerId;
  int branchfromId;
  int carId;
  String carName;
  String carNameEn;
  String carPrice;
  int cityId;
  String cityName;
  String cityNameEn;
  int branchtoId;
  int deliveryId;
  String deliveryImage;
  String totalPrice;
  String acceptedDate;
  String userName;
  String userNameEn;
  int status;
  int type;
  String code;
  int transferOrder;
  String deliveryName;
  String deliveryNameEn;
  String deliveryPhone;
  String createdAt;
  String updatedAt;
  Package package;

  Data(
      {this.id,
        this.dealerId,
        this.dealerImage,
        this.todealerId,
        this.branchfromId,
        this.carId,
        this.carName,
        this.carNameEn,
        this.carPrice,
        this.cityId,
        this.cityName,
        this.cityNameEn,
        this.branchtoId,
        this.deliveryId,
        this.deliveryImage,
        this.totalPrice,
        this.acceptedDate,
        this.userName,
        this.userNameEn,
        this.status,
        this.type,
        this.code,
        this.transferOrder,
        this.deliveryName,
        this.deliveryNameEn,
        this.deliveryPhone,
        this.createdAt,
        this.updatedAt,
        this.package});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dealerId = json['dealer_id'];
    dealerImage = json['dealer_image'];
    todealerId = json['todealer_id'];
    branchfromId = json['branchfrom_id'];
    carId = json['car_id'];
    carName = json['car_name'];
    carNameEn = json['car_name_en'];
    carPrice = json['car_price'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    cityNameEn = json['city_name_en'];
    branchtoId = json['branchto_id'];
    deliveryId = json['delivery_id'];
    deliveryImage = json['delivery_image'];
    totalPrice = json['total_price'];
    acceptedDate = json['accepted_date'];
    userName = json['user_name'];
    userNameEn = json['user_name_en'];
    status = json['status'];
    type = json['type'];
    code = json['code'];
    transferOrder = json['transfer_order'];
    deliveryName = json['delivery_name'].toString();
    deliveryNameEn = json['delivery_name_en'];
    deliveryPhone = json['delivery_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dealer_id'] = this.dealerId;
    data['dealer_image'] = this.dealerImage;
    data['todealer_id'] = this.todealerId;
    data['branchfrom_id'] = this.branchfromId;
    data['car_id'] = this.carId;
    data['car_name'] = this.carName;
    data['car_name_en'] = this.carNameEn;
    data['car_price'] = this.carPrice;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['city_name_en'] = this.cityNameEn;
    data['branchto_id'] = this.branchtoId;
    data['delivery_id'] = this.deliveryId;
    data['delivery_image'] = this.deliveryImage;
    data['total_price'] = this.totalPrice;
    data['accepted_date'] = this.acceptedDate;
    data['user_name'] = this.userName;
    data['user_name_en'] = this.userNameEn;
    data['status'] = this.status;
    data['type'] = this.type;
    data['code'] = this.code;
    data['transfer_order'] = this.transferOrder;
    data['delivery_name'] = this.deliveryName;
    data['delivery_name_en'] = this.deliveryNameEn;
    data['delivery_phone'] = this.deliveryPhone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.package != null) {
      data['package'] = this.package.toJson();
    }
    return data;
  }
}

class Package {
  int id;
  int orderId;
  int deliveryId;
  int branchfromId;
  int branchtoId;
  String userName;
  String userNameEn;
  String phone;
  String paymentType;
  String price;
  String lat;
  String lng;
  String address;
  String desc;
  String descEn;
  Null orderDirection;
  Null orderDirectionEn;
  String code;
  String streetName;
  int recieveType;
  String reason;
  String reasonEn;
  String deliveryPrice;
  String coponId;
  int status;
  String createdAt;
  String updatedAt;
  String addressFrom;
  String lngFrom;
  String latFrom;
  String packageImage;

  Package(
      {this.id,
        this.orderId,
        this.deliveryId,
        this.branchfromId,
        this.branchtoId,
        this.userName,
        this.userNameEn,
        this.phone,
        this.paymentType,
        this.price,
        this.lat,
        this.lng,
        this.address,
        this.desc,
        this.descEn,
        this.orderDirection,
        this.orderDirectionEn,
        this.code,
        this.streetName,
        this.recieveType,
        this.reason,
        this.reasonEn,
        this.deliveryPrice,
        this.coponId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.addressFrom,
        this.lngFrom,
        this.latFrom,
        this.packageImage});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    deliveryId = json['delivery_id'];
    branchfromId = json['branchfrom_id'];
    branchtoId = json['branchto_id'];
    userName = json['user_name'];
    userNameEn = json['user_name_en'];
    phone = json['phone'];
    paymentType = json['payment_type'];
    price = json['price'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    desc = json['desc'];
    descEn = json['desc_en'];
    orderDirection = json['order_direction'];
    orderDirectionEn = json['order_direction_en'];
    code = json['code'];
    streetName = json['street_name'];
    recieveType = json['recieve_type'];
    reason = json['reason'];
    reasonEn = json['reason_en'];
    deliveryPrice = json['delivery_price'];
    coponId = json['copon_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addressFrom = json['address_from'];
    lngFrom = json['lng_from'];
    latFrom = json['lat_from'];
    packageImage = json['PackageImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['delivery_id'] = this.deliveryId;
    data['branchfrom_id'] = this.branchfromId;
    data['branchto_id'] = this.branchtoId;
    data['user_name'] = this.userName;
    data['user_name_en'] = this.userNameEn;
    data['phone'] = this.phone;
    data['payment_type'] = this.paymentType;
    data['price'] = this.price;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['desc'] = this.desc;
    data['desc_en'] = this.descEn;
    data['order_direction'] = this.orderDirection;
    data['order_direction_en'] = this.orderDirectionEn;
    data['code'] = this.code;
    data['street_name'] = this.streetName;
    data['recieve_type'] = this.recieveType;
    data['reason'] = this.reason;
    data['reason_en'] = this.reasonEn;
    data['delivery_price'] = this.deliveryPrice;
    data['copon_id'] = this.coponId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['address_from'] = this.addressFrom;
    data['lng_from'] = this.lngFrom;
    data['lat_from'] = this.latFrom;
    data['PackageImage'] = this.packageImage;
    return data;
  }
}
