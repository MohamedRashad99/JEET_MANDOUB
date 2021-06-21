class UnderWayModel {
  String msg;
  List<Data> data;

  UnderWayModel({this.msg, this.data});

  UnderWayModel.fromJson(Map<String, dynamic> json) {
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
  String acceptedDate;
  String code;
  String dealerName;
  String dealerNameEn;

  Data(
      {this.id,
        this.acceptedDate,
        this.code,
        this.dealerName,
        this.dealerNameEn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acceptedDate = json['accepted_date'];
    code = json['code'];
    dealerName = json['dealer_name'];
    dealerNameEn = json['dealer_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accepted_date'] = this.acceptedDate;
    data['code'] = this.code;
    data['dealer_name'] = this.dealerName;
    data['dealer_name_en'] = this.dealerNameEn;
    return data;
  }
}
