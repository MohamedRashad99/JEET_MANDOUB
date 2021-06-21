import 'package:dio/dio.dart';
import 'package:jeet/network/network.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CollectController {
  NetWork _netWork = NetWork();
  Future<void> getMoneyData({Amount, Name, Bank, Iban}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("تجميع فلوس" + _prefs.getString("token"));
    Map<String, dynamic> _body = {
      "amount": Amount,
      "name": Name,
      "bank": Bank,
      "iban": Iban,
    };
    FormData _formData = FormData.fromMap(_body);
    var response = await _netWork.postData(
        url: 'deliverydrawbalance',
        formData: _formData,
        headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization": "Bearer ${_prefs.getString("token")} "});
    if (response != null) {
      print(response);
    } else {
      print("error");
    }

    return response;

    // final _dio = Dio();
    // final response = await _dio.post('https://jeeet.net/api/deliverydrawbalance',
    // data: {
    //   "amount" : Amount ,
    //   "name" : Name ,
    //   "bank" : Bank ,
    //   "iban" : Iban ,
    // }
    // ,
    //   options:Options(
    //     headers: {"Authorization":"Bearer ${_prefs.getString("token")}"},
    //     contentType: "application/json"
    //   )
    // );
    // print(response.statusCode);
    // print(response.data);
  }
}
