import 'package:jeet/network/network.dart';
import 'package:jeet/screens/ordersRecord/pages/Bounced/Data/BouncedModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BouncedController {
  NetWork _netWork = NetWork();
  BouncedModel _bouncedModel = BouncedModel();
  // UnderWayModel _wayModel =UnderWayModel();

  Future<BouncedModel> getBounced() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(
      "مرتجع " + preferences.getString("token"),
    );
    var data = await _netWork.getData(url: 'deliveryordersbouncedrecording', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString("token")}',
    });
    if (data == null || data == "internet") {
      _bouncedModel = null;
      return _bouncedModel;
    } else {
      _bouncedModel = BouncedModel.fromJson(data);
      print(data);
      return _bouncedModel;
    }
  }
}
