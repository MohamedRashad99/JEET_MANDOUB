class ParcelsModel {
  String msg;
  Data data;

  ParcelsModel({this.msg, this.data});

  ParcelsModel.fromJson(Map<String, dynamic> json) {
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
  String reciveFromLat;
  String reciveFromLng;
  String reciveFromAddress;
  String reciveToLat;
  String reciveToLng;
  String reciveToAddress;
  String price;
  String deliveryPrice;
  String code;
  String userName;
  String userNameEn;
  String paymentType;
  int status;
  String desc;
  String descEn;
  String streetName;
  String streetNameEn;

  Data(
      {this.id,
        this.reciveFromLat,
        this.reciveFromLng,
        this.reciveFromAddress,
        this.reciveToLat,
        this.reciveToLng,
        this.reciveToAddress,
        this.price,
        this.deliveryPrice,
        this.code,
        this.userName,
        this.userNameEn,
        this.paymentType,
        this.status,
        this.desc,
        this.descEn,
        this.streetName,
        this.streetNameEn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reciveFromLat = json['recive_from_lat'];
    reciveFromLng = json['recive_from_lng'];
    reciveFromAddress = json['recive_from_address'];
    reciveToLat = json['recive_to_lat'];
    reciveToLng = json['recive_to_lng'];
    reciveToAddress = json['recive_to_address'];
    price = json['price'];
    deliveryPrice = json['delivery_price'];
    code = json['code'];
    userName = json['user_name'];
    userNameEn = json['user_name_en'];
    paymentType = json['payment_type'];
    status = json['status'];
    desc = json['desc'];
    descEn = json['desc_en'];
    streetName = json['street_name'];
    streetNameEn = json['street_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recive_from_lat'] = this.reciveFromLat;
    data['recive_from_lng'] = this.reciveFromLng;
    data['recive_from_address'] = this.reciveFromAddress;
    data['recive_to_lat'] = this.reciveToLat;
    data['recive_to_lng'] = this.reciveToLng;
    data['recive_to_address'] = this.reciveToAddress;
    data['price'] = this.price;
    data['delivery_price'] = this.deliveryPrice;
    data['code'] = this.code;
    data['user_name'] = this.userName;
    data['user_name_en'] = this.userNameEn;
    data['payment_type'] = this.paymentType;
    data['status'] = this.status;
    data['desc'] = this.desc;
    data['desc_en'] = this.descEn;
    data['street_name'] = this.streetName;
    data['street_name_en'] = this.streetNameEn;
    return data;
  }
}
