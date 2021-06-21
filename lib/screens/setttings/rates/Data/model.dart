class RateModel {
  String msg;
  List<Data> data;

  RateModel({this.msg, this.data});

  RateModel.fromJson(Map<String, dynamic> json) {
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
  int dealerId;
  int deliveryId;
  String dealerName;
  String dealerNameEn;
  String dealerImage;
  int rate;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.dealerId,
        this.deliveryId,
        this.dealerName,
        this.dealerNameEn,
        this.dealerImage,
        this.rate,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dealerId = json['dealer_id'];
    deliveryId = json['delivery_id'];
    dealerName = json['dealer_name'];
    dealerNameEn = json['dealer_name_en'];
    dealerImage = json['dealer_image'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dealer_id'] = this.dealerId;
    data['delivery_id'] = this.deliveryId;
    data['dealer_name'] = this.dealerName;
    data['dealer_name_en'] = this.dealerNameEn;
    data['dealer_image'] = this.dealerImage;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
