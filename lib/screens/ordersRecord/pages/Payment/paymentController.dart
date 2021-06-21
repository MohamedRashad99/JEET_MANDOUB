import 'package:jeet/network/network.dart';
import 'package:jeet/screens/ordersRecord/pages/Payment/paymentModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PaymentController {

  NetWork _netWork = NetWork();
  PaymentModel _paymentModel = PaymentModel();
 // UnderWayModel _wayModel =UnderWayModel();

  Future<PaymentModel> getPayment() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("تم الدفع" + preferences.getString("token"),);
    var data = await _netWork.getData(url: 'deliveryorderscashpaymentrecording',
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer ${preferences.getString("token")}',

        });
   // print(data);
    if (data == null || data == "internet") {
      _paymentModel = null;
      return _paymentModel;
    } else {
      _paymentModel = PaymentModel.fromJson(data);
      print(data);
      return _paymentModel;
    }
  }
}