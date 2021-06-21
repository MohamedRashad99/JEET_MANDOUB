class ProfileModel {
  String msg;
  Data data;

  ProfileModel({this.msg, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  Delivery delivery;
  DeliveryDetails deliveryDetails;

  Data({this.delivery, this.deliveryDetails});

  Data.fromJson(Map<String, dynamic> json) {
    delivery = json['delivery'] != null
        ? new Delivery.fromJson(json['delivery'])
        : null;
    deliveryDetails = json['deliveryDetails'] != null
        ? new DeliveryDetails.fromJson(json['deliveryDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.delivery != null) {
      data['delivery'] = this.delivery.toJson();
    }
    if (this.deliveryDetails != null) {
      data['deliveryDetails'] = this.deliveryDetails.toJson();
    }
    return data;
  }
}

class Delivery {
  int id;
  String name;
  String nameEn;
  String email;
  String emailVerifiedAt;
  String password;
  String url;
  String website;
  String commericalIdnumber;
  String storeName;
  String storeNameEn;
  String typeOfGoods;
  String typeOfGoodsEn;
  String phone;
  String type;
  int isSuperAdmin;
  int confirm;
  int accept;
  int online;
  int cityId;
  String cityName;
  String cityNameEn;
  int carId;
  String carName;
  String carNameEn;
  String image;
  int rate;
  String lat;
  String lng;
  String address;
  Null googleToken;
  String apiToken;
  int points;
  int block;
  int paymentOrder;
  int complete;
  int kilometer;
  Null commericalNumber;
  int editCommericalIdnumber;
  String createdAt;
  String updatedAt;

  Delivery(
      {this.id,
        this.name,
        this.nameEn,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.url,
        this.website,
        this.commericalIdnumber,
        this.storeName,
        this.storeNameEn,
        this.typeOfGoods,
        this.typeOfGoodsEn,
        this.phone,
        this.type,
        this.isSuperAdmin,
        this.confirm,
        this.accept,
        this.online,
        this.cityId,
        this.cityName,
        this.cityNameEn,
        this.carId,
        this.carName,
        this.carNameEn,
        this.image,
        this.rate,
        this.lat,
        this.lng,
        this.address,
        this.googleToken,
        this.apiToken,
        this.points,
        this.block,
        this.paymentOrder,
        this.complete,
        this.kilometer,
        this.commericalNumber,
        this.editCommericalIdnumber,
        this.createdAt,
        this.updatedAt});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    url = json['url'];
    website = json['website'];
    commericalIdnumber = json['commerical_idnumber'];
    storeName = json['store_name'];
    storeNameEn = json['store_name_en'];
    typeOfGoods = json['type_of_goods'];
    typeOfGoodsEn = json['type_of_goods_en'];
    phone = json['phone'];
    type = json['type'];
    isSuperAdmin = json['is_superAdmin'];
    confirm = json['confirm'];
    accept = json['accept'];
    online = json['online'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    cityNameEn = json['city_name_en'];
    carId = json['car_id'];
    carName = json['car_name'];
    carNameEn = json['car_name_en'];
    image = json['image'];
    rate = json['rate'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    googleToken = json['google_token'];
    apiToken = json['api_token'];
    points = json['points'];
    block = json['block'];
    paymentOrder = json['paymentOrder'];
    complete = json['complete'];
    kilometer = json['kilometer'];
    commericalNumber = json['commerical_number'];
    editCommericalIdnumber = json['edit_commerical_idnumber'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['url'] = this.url;
    data['website'] = this.website;
    data['commerical_idnumber'] = this.commericalIdnumber;
    data['store_name'] = this.storeName;
    data['store_name_en'] = this.storeNameEn;
    data['type_of_goods'] = this.typeOfGoods;
    data['type_of_goods_en'] = this.typeOfGoodsEn;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['is_superAdmin'] = this.isSuperAdmin;
    data['confirm'] = this.confirm;
    data['accept'] = this.accept;
    data['online'] = this.online;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['city_name_en'] = this.cityNameEn;
    data['car_id'] = this.carId;
    data['car_name'] = this.carName;
    data['car_name_en'] = this.carNameEn;
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['google_token'] = this.googleToken;
    data['api_token'] = this.apiToken;
    data['points'] = this.points;
    data['block'] = this.block;
    data['paymentOrder'] = this.paymentOrder;
    data['complete'] = this.complete;
    data['kilometer'] = this.kilometer;
    data['commerical_number'] = this.commericalNumber;
    data['edit_commerical_idnumber'] = this.editCommericalIdnumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DeliveryDetails {
  int id;
  int deliveryId;
  String idNumber;
  String licenseExpireDate;
  String idImage;
  String licenseImage;
  String insuranceImage;
  String frontImage;
  String backImage;
  String plateNumber;
  String createdAt;
  String updatedAt;

  DeliveryDetails(
      {this.id,
        this.deliveryId,
        this.idNumber,
        this.licenseExpireDate,
        this.idImage,
        this.licenseImage,
        this.insuranceImage,
        this.frontImage,
        this.backImage,
        this.plateNumber,
        this.createdAt,
        this.updatedAt});

  DeliveryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryId = json['delivery_id'];
    idNumber = json['id_number'];
    licenseExpireDate = json['license_expire_date'];
    idImage = json['id_image'];
    licenseImage = json['license_image'];
    insuranceImage = json['insurance_image'];
    frontImage = json['front_image'];
    backImage = json['back_image'];
    plateNumber = json['plate_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delivery_id'] = this.deliveryId;
    data['id_number'] = this.idNumber;
    data['license_expire_date'] = this.licenseExpireDate;
    data['id_image'] = this.idImage;
    data['license_image'] = this.licenseImage;
    data['insurance_image'] = this.insuranceImage;
    data['front_image'] = this.frontImage;
    data['back_image'] = this.backImage;
    data['plate_number'] = this.plateNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
