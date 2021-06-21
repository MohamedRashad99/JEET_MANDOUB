import 'package:jeet/network/network.dart';
import 'package:jeet/screens/ordersRecord/pages/Uderway/Data/underwayRecordOrderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';



class OrdersController {
  UnderWayModel _underWayModel = UnderWayModel();
  NetWork _netWork = NetWork();
  Future<UnderWayModel> getOrders() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("قيد التنفيذ" + preferences.getString("token"),);

    var data = await _netWork.getData(url: 'deliveryordersunderwayrecording',
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer '+ preferences.getString("token"),

        });
   // print(data);
    if (data == null || data == "internet") {
      _underWayModel = null;
      return  _underWayModel;
    } else {
      _underWayModel = UnderWayModel.fromJson(data);
      print("تماااااااااااااااااااااااام");
      print(data);
      return  _underWayModel;
    }
  }
}