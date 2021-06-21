class deliveryBalanceModel {
  String msg;
  Data data;

  deliveryBalanceModel({this.msg, this.data});

  deliveryBalanceModel.fromJson(Map<String, dynamic> json) {
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
  int deliveryId;
  String balance;
  String note;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.deliveryId,
        this.balance,
        this.note,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryId = json['delivery_id'];
    balance = json['balance'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delivery_id'] = this.deliveryId;
    data['balance'] = this.balance;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
