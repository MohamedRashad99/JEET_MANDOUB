import 'package:jeet/network/network.dart';
import 'package:jeet/screens/ordersRecord/pages/Done/doneModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DoneController {
  NetWork _netWork = NetWork();
  DoneModel _doneModel = DoneModel();

  Future<DoneModel> getDone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(
      "وصل" + preferences.getString("token"),
    );
    var data = await _netWork.getData(url: 'deliveryordersendedrecording', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString("token")}',
    });
    // print(data);
    if (data == null || data == "internet") {
      _doneModel = null;
      return _doneModel;
    } else {
      _doneModel = DoneModel.fromJson(data);
      print(data);
      return _doneModel;
    }
  }
}
