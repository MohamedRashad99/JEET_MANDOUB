import 'package:jeet/network/network.dart';
import 'package:jeet/screens/setttings/Rates/Data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateController{

  NetWork _netWork = NetWork();
  RateModel _rateModel =RateModel();

  Future<RateModel>getRateData ()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("تقيم المستخدم " + preferences.getString("token"),);
    var response = await _netWork.getData(url: "delivery_rates",
        headers: {
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization':'Bearer '+ preferences.getString("token"),
    }) ;
    if(response!=null){
      _rateModel=RateModel.fromJson(response);
      print(response);
    }else{
      RateModel(msg: "success");
    }
    print(response);
    return _rateModel;
  }


  }