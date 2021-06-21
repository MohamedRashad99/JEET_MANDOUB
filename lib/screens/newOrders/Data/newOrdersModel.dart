// To parse this JSON data, do
//
//     final newOrderModel = newOrderModelFromJson(jsonString);

import 'dart:convert';

NewOrderModel newOrderModelFromJson(String str) => NewOrderModel.fromJson(json.decode(str));

String newOrderModelToJson(NewOrderModel data) => json.encode(data.toJson());

class NewOrderModel {
  NewOrderModel({
    this.msg,
    this.data,
  });

  String msg;
  List<Datum> data;

  factory NewOrderModel.fromJson(Map<String, dynamic> json) => NewOrderModel(
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.dealerId,
    this.dealerName,
    this.dealerNameEn,
    this.dealer_rate,
    this.carId,
    this.carName,
    this.carNameEn,
    this.cityId,
    this.cityName,
    this.cityNameEn,
    this.totalPrice,
    this.status,
    this.type,
    this.code,
  });

  int id;
  int dealerId;
  String dealerName;
  String dealerNameEn;
  int dealer_rate;
  int carId;
  String carName;
  String carNameEn;
  int cityId;
  String cityName;
  String cityNameEn;
  String totalPrice;
  int status;
  int type;
  String code;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    dealerId: json["dealer_id"],
    dealerName: json["dealer_name"],
    dealerNameEn: json["dealer_name_en"],
    dealer_rate: json["dealer_rate"],
    carId: json["car_id"],
    carName: json["car_name"],
    carNameEn: json["car_name_en"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    cityNameEn: json["city_name_en"],
    totalPrice: json["total_price"] == null ? null : json["total_price"].toString(),
    status: json["status"],
    type: json["type"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dealer_id": dealerId,
    "dealer_name": dealerName,
    "dealer_name_en": dealerNameEn,
    "dealer_rate": dealer_rate,
    "car_id": carId,
    "car_name": carName,
    "car_name_en": carNameEn,
    "city_id": cityId,
    "city_name": cityName,
    "city_name_en": cityNameEn,
    "total_price": totalPrice == null ? null : totalPrice,
    "status": status,
    "type": type,
    "code": code,
  };
}
