import 'package:dio/dio.dart';
import 'package:jeet/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jeet/screens/parcelsDetails/Data/Model.dart';


class ParcelsController{

  NetWork _netWork = NetWork();
  ParcelsModel _parcelsModel =ParcelsModel();

  Future<ParcelsModel> getParcelsData({int packageID} ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("تمام جدا"+ _prefs.getString("token"));
    Map<String, dynamic> _body = {
     "package_id" : packageID ,

    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await _netWork.postData(url: 'showpackgefromorder', formData: _formData,
        headers:{
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization":"Bearer ${_prefs.getString("token")} "

        });

    if (response!=null) {
      _parcelsModel = ParcelsModel.fromJson(response);
     // _prefs.setInt("id", _parcelsModel.data.id);

      print(response);
    } else {
      _parcelsModel = ParcelsModel(msg: "success");
    }
    return _parcelsModel;
  }

}