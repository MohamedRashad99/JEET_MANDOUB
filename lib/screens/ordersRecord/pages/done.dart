import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/ordersRecord/pages/Uderway/Data/underwayRecordOrderController.dart';
import 'package:jeet/screens/ordersRecord/pages/Uderway/Data/underwayRecordOrderModel.dart';
import 'package:jeet/screens/statusOrders/view.dart';
import 'package:easy_localization/easy_localization.dart';

class Done extends StatefulWidget {
  final Function getDoneD;

  const Done({this.getDoneD});
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  UnderWayModel _wayModel = UnderWayModel();
  OrdersController _underwayController = OrdersController();
  bool loading = true;

  void getDataD() async {
    _wayModel = await _underwayController.getOrders();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return loading
        ? SpinKitChasingDots(
            size: 20,
            color: kPrimaryColor,
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: _wayModel.data.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StatusforEveryOrders()),
                  );
                },
                child: Container(
                  height: height * .26,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.dateOf.tr(),
                              style: TextStyle(fontFamily: 'dinnextl medium', fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _wayModel.data[index].acceptedDate.toString(),
                              style: TextStyle(fontFamily: 'dinnextl medium', fontSize: 13, color: kTextColor),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Divider(
                        height: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.orderNumber.tr(),
                              style: TextStyle(fontFamily: 'dinnextl medium', fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _wayModel.data[index].code.toString(),
                              style: TextStyle(fontFamily: 'dinnextl medium', fontSize: 13, color: kTextColor),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Divider(
                        height: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.captainName.tr(),
                              style: TextStyle(fontFamily: 'dinnextl medium', fontSize: 15),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _wayModel.data[index].dealerName.toString(),
                              style: TextStyle(fontFamily: 'dinnextl medium', fontSize: 13, color: kTextColor),
                              textAlign: TextAlign.start,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
