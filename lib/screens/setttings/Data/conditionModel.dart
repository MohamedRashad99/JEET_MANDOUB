class ConditionModel {
  String msg;
  List<Data> data;

  ConditionModel({this.msg, this.data});

  ConditionModel.fromJson(Map<String, dynamic> json) {
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
  String value;
  String valueEn;

  Data({this.value, this.valueEn});

  Data.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    valueEn = json['value_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['value_en'] = this.valueEn;
    return data;
  }
}
