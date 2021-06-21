import 'package:jeet/network/network.dart';
import 'package:jeet/screens/newOrders/Data/newOrdersModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewOrderController{
  NetWork _netWork = NetWork();
  NewOrderModel _newOrderModel=NewOrderModel();
  Future<NewOrderModel>getNewOrderData ()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("صح الطلبات الجديدة" + preferences.getString("token"),);

    // 2hDjxsFFtoQ93eG6Jc0hcWnfuyMYhWyBnWTn7tZ2IRuxJ7bUGBSlDkOzwR2nroMtcecaIPcPCQBnw88MeTY3LWC6cnkW6Id4cJBe'
    var response = await _netWork.getData(url: "neworders", headers: {
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization':'Bearer '+ preferences.getString("token"),
    }) ;
    if(response!=null){
      _newOrderModel=NewOrderModel.fromJson(response);
      print(response);
    }else{
      NewOrderModel(msg: "success");
    }
    return _newOrderModel;
  }
}