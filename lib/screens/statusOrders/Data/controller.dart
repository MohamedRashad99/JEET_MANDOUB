import 'package:dio/dio.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/statusOrders/Data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParcelStatusController{
  NetWork _netWork = NetWork();
  ParcelsStatusModel _parcelsStatusModel = ParcelsStatusModel();
  Future<ParcelsStatusModel> getParcelsStatusData({int packageID, } ) async{
    //int Status , String Reason
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("تفاصيل الطلب داخل الباكيدجز"+ _prefs.getString("token"));
    Map<String, dynamic> _body = {
      "package_id" : packageID ,
      // "status":Status,
      // if(Reason!=null)
      //   "reason":"${Reason}",
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await _netWork.postData(url: 'showpackage', formData: _formData,
        headers:{
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization":"Bearer ${_prefs.getString("token")} "
        });

    if (response!=null) {
      _parcelsStatusModel = ParcelsStatusModel.fromJson(response);

      print(response);
    } else {
      _parcelsStatusModel = ParcelsStatusModel(msg: "success");
    }
    return _parcelsStatusModel;
  }

}