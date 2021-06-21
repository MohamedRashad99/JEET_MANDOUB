import 'package:jeet/network/network.dart';
import 'package:jeet/screens/wallet/Data/deliveryBalanceModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class deliveryBalanceController {
  NetWork _netWork = NetWork();
  deliveryBalanceModel _deliveryBalanceModel = deliveryBalanceModel();

  Future<deliveryBalanceModel> getDeliveryBalancerData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("قيمةالمحفظه الحاليه" + preferences.getString("token"),);
    var data = await _netWork.getData(url: 'deliverybalance',
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'Authorization':'Bearer ${preferences.getString("token")}',

        });
     print(data);
    if (data == null || data == "internet") {
      _deliveryBalanceModel = null;
      return  _deliveryBalanceModel;
    } else {
      _deliveryBalanceModel = deliveryBalanceModel.fromJson(data);
      print(data);
      return  _deliveryBalanceModel;
    }
    }

}


