import 'package:jeet/network/network.dart';
import 'package:jeet/screens/Parcels/Data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
class ShowOrderController{

  NetWork _netWork = NetWork();
  ShoworderModel _showorderModel =ShoworderModel();


  Future<ShoworderModel> getParcelsData({int ordersID} ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("قائمه الطلبات الجديده"+ _prefs.getString("token"));
    Map<String, dynamic> _body = {
      "order_id" : ordersID ,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await _netWork.postData(url: 'show_order', formData: _formData,
        headers:{
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization":"Bearer ${_prefs.getString("token")} "
        });
    print(response);
    if (response!=null) {
      _showorderModel = ShoworderModel.fromJson(response);
      print(response);
    } else {
      _showorderModel = ShoworderModel(msg: "success");
    }
    return _showorderModel;
  }
}