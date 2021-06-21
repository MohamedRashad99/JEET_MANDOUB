import 'package:flutter/material.dart';
import 'package:jeet/screens/statusOrders/Data/controller.dart';
import 'package:jeet/screens/statusOrders/Data/model.dart';
import 'package:jeet/screens/statusOrders/view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/Parcels/Data/model.dart';
import 'package:jeet/screens/Parcels/Data/controller.dart';

class ParclesPackages extends StatefulWidget {
  final int orderID;

  ParclesPackages({this.orderID});

  @override
  _ParclesPackagesState createState() => _ParclesPackagesState();
}

class _ParclesPackagesState extends State<ParclesPackages> {
  ShoworderModel _showorderModel = ShoworderModel();
  ShowOrderController _showOrderController = ShowOrderController();

  //////////////////////
  ParcelsStatusModel _parcelsStatusModel = ParcelsStatusModel();
  ParcelStatusController _parcelStatusController = ParcelStatusController();

  bool loading = true;
  Future _getData() async {
    _showorderModel = await _showOrderController.getParcelsData(ordersID: widget.orderID);
    setState(() {
      loading = false;
    });
  }

/*  Future _getStatusForData ()async{
    _parcelsStatusModel = await _parcelStatusController.getParcelsStatusData(
      packageID: _parcelsStatusModel.data.id,
      Status: _parcelsStatusModel.data.package.status==2? 2 : _parcelsStatusModel.data.package.status == 4 ? 4:null,
      Reason: _parcelsStatusModel.data.package.reason ==null ? null :_parcelsStatusModel.data.package.reason.toString(),
    );
  }*/
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.parcels.tr(),
          style: TextStyle(fontFamily: 'dinnextl bold'),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: loading
          ? SpinKitChasingDots(
              size: 20,
              color: kPrimaryColor,
            )
          : ListView.builder(
              itemCount: _showorderModel.data.length,
              itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatusforEveryOrders(
                                  packageId: _showorderModel.data[index].id,
                                  // status: _parcelsStatusModel.data.package.status==2 ? 2: _parcelsStatusModel.data.package.status==4 ? 4:null,
                                  // reason:_parcelsStatusModel.data.package.reason ==null ? null :_parcelsStatusModel.data.package.reason.toString(),
                                )),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Container(
                        height: height * .25,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(LocaleKeys.dateOf.tr(),
                                style: TextStyle(
                                  fontFamily: "dinnextl bold",
                                  color: Colors.black,
                                  fontSize: 14,
                                )),
                            Text(_showorderModel.data[index].acceptedDate, style: TextStyle(fontSize: 14,fontFamily: 'dinnextl medium', color: kTextColor)),
                            Divider(
                              height: 2,
                            ),
                            Text(LocaleKeys.deliveryBoyName.tr(),
                                style: TextStyle(
                                  fontFamily: "dinnextl bold",
                                  color: Colors.black,
                                  fontSize: 14,
                                )),
                            Text(_showorderModel.data[index].dealerName.toString(),
                                style: TextStyle(fontSize: 14,fontFamily: 'dinnextl medium', color: kTextColor)),
                            Divider(
                              height: 2,
                            ),
                            Text(LocaleKeys.parcelsTrackingNum.tr(),
                                style: TextStyle(
                                  fontFamily: "dinnextl bold",
                                  color: Colors.black,
                                  fontSize: 14,
                                )),
                            Text(_showorderModel.data[index].code, style: TextStyle(fontSize: 14,fontFamily: 'dinnextl medium', color: kTextColor)),
                          ],
                        ),
                      ),
                    ),
                  )),
    );
  }
}
