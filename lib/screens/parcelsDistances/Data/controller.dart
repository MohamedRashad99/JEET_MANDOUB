import 'package:dio/dio.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/parcelsDistances/Data/Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewOrderController{

  NetWork _netWork = NetWork();
  ShowNewOrderModel _showNewOrderModel=ShowNewOrderModel();


Future<ShowNewOrderModel> getNewOderData({orderID}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  print("صح يا باشا" + preferences.getString("token"),);
  Map<String, dynamic> _body = {
     // "order_id" :588,
    "order_id" : orderID,
  };
  FormData _formData = FormData.fromMap(_body);
    var response = await _netWork.postData(url: 'showneworder', formData: _formData,
        headers:{
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization':'Bearer '+ preferences.getString("token"),

        });
    if (response!=null) {
      _showNewOrderModel = ShowNewOrderModel.fromJson(response);
     print(response);
    } else {
      _showNewOrderModel =
          ShowNewOrderModel(msg: "success");
    }

    return _showNewOrderModel;
  }


}