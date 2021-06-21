class ShowNewOrderModel {
  String msg;
  List<Data> data;

  ShowNewOrderModel({this.msg, this.data});

  ShowNewOrderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int orderId;
  int deliveryId;
  int branchfromId;
  int branchtoId;
  String userName;
  String userNameEn;
  String phone;
  String paymentType;
  int paymentId;
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
  String streetNameEn;
  int recieveType;
  String reason;
  String reasonEn;
  String deliveryPrice;
  String deliveryLat;
  String deliveryLng;
  String deliveryAddress;
  String coponId;
  int status;
  String createdAt;
  String updatedAt;
  var placeOfReceipt;
  var deliverySite;

  Data(
      {this.id,
        this.orderId,
        this.deliveryId,
        this.branchfromId,
        this.branchtoId,
        this.userName,
        this.userNameEn,
        this.phone,
        this.paymentType,
        this.paymentId,
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
        this.streetNameEn,
        this.recieveType,
        this.reason,
        this.reasonEn,
        this.deliveryPrice,
        this.deliveryLat,
        this.deliveryLng,
        this.deliveryAddress,
        this.coponId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.placeOfReceipt,
        this.deliverySite});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    deliveryId = json['delivery_id'];
    branchfromId = json['branchfrom_id'];
    branchtoId = json['branchto_id'];
    userName = json['user_name'];
    userNameEn = json['user_name_en'];
    phone = json['phone'];
    paymentType = json['payment_type'];
    paymentId = json['payment_id'];
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
    streetNameEn = json['street_name_en'];
    recieveType = json['recieve_type'];
    reason = json['reason'];
    reasonEn = json['reason_en'];
    deliveryPrice = json['delivery_price'];
    deliveryLat = json['delivery_lat'];
    deliveryLng = json['delivery_lng'];
    deliveryAddress = json['delivery_address'];
    coponId = json['copon_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    placeOfReceipt = json['place_of_receipt'];
    deliverySite = json['delivery_site'];
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
    data['payment_id'] = this.paymentId;
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
    data['street_name_en'] = this.streetNameEn;
    data['recieve_type'] = this.recieveType;
    data['reason'] = this.reason;
    data['reason_en'] = this.reasonEn;
    data['delivery_price'] = this.deliveryPrice;
    data['delivery_lat'] = this.deliveryLat;
    data['delivery_lng'] = this.deliveryLng;
    data['delivery_address'] = this.deliveryAddress;
    data['copon_id'] = this.coponId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['place_of_receipt'] = this.placeOfReceipt;
    data['delivery_site'] = this.deliverySite;
    return data;
  }
}
