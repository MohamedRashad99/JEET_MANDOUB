// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.msg,
    this.data,
  });

  String msg;
  Data data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.firstAds,
    this.secondAds,
  });

  List<Ad> firstAds;
  List<Ad> secondAds;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstAds: List<Ad>.from(json["first_ads"].map((x) => Ad.fromJson(x))),
    secondAds: List<Ad>.from(json["second_ads"].map((x) => Ad.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_ads": List<dynamic>.from(firstAds.map((x) => x.toJson())),
    "second_ads": List<dynamic>.from(secondAds.map((x) => x.toJson())),
  };
}

class Ad {
  Ad({
    this.id,
    this.image,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String image;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    id: json["id"],
    image: json["image"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
