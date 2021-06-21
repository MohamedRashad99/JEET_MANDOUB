import 'package:dio/dio.dart';
import 'package:jeet/network/network.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class BankController {
  NetWork _netWork = NetWork();
  Future<void> setBankData({
    int deliveryID,
    int amount,
    File image,
    String senederName,
  }) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("تحويل بنكي " + _prefs.getString("token"));
    Map<String, dynamic> _body = {
      "delivery_id": deliveryID,
      "amount": amount,
      "image": await MultipartFile.fromFile(image.path),
      "sender_name": senederName,
    };
    FormData _formData = FormData.fromMap(_body);
    var response = await _netWork.postData(
        url: 'deliverybank_transfer',
        formData: _formData,
        headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization": "Bearer ${_prefs.getString("token")} "});
    if (response != null) {
      print(response);
    } else {
      print("error");
    }
    print(response);
    return response;
  }
}
