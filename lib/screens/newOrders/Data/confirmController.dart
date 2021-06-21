import 'package:dio/dio.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/newOrders/Data/confirmModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmController {
  NetWork _netWork = NetWork();
  ConfirmationModel _confirmationModel = ConfirmationModel();

  Future<ConfirmationModel> getConfirmData(int orderID, int status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(
      "موافقه الطلبات" + preferences.getString("token"),
    );
    Map<String, dynamic> _body = {
      "order_id": orderID ?? 0,
      "status": status ?? 0,
      /*   "order_id":588,
      "status":1*/
    };
    FormData _formData = FormData.fromMap(_body);

    var response = await _netWork.postData(url: 'confirmorder', formData: _formData, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ' + preferences.getString("token"),
    });
    if (response != null) {
      _confirmationModel = ConfirmationModel.fromJson(response);
      print(response);
    } else {
      _confirmationModel = ConfirmationModel(msg: "success");
    }
    return _confirmationModel;
  }
}
