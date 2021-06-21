import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/parcelsDetails/Data/Controller.dart';
import 'package:jeet/screens/parcelsDetails/Data/Model.dart';
import 'package:jeet/screens/parcelsDetails/my_map.dart';
import 'package:jeet/screens/parcelsDistances/Data/Model.dart';
import 'package:jeet/screens/parcelsDistances/Data/controller.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:jeet/widgets/customButton.dart';
import '../../constants.dart';

class ParecelsDistances extends StatefulWidget {
  final int orderID;

  ParecelsDistances({this.orderID});
  @override
  _ParecelsDistancesState createState() => _ParecelsDistancesState();
}

class _ParecelsDistancesState extends State<ParecelsDistances> {
  ShowNewOrderModel _showNewOrderModel = ShowNewOrderModel();
  NewOrderController _newOrderController = NewOrderController();

  ParcelsModel _parcelsModel = ParcelsModel();
  ParcelsController _parcelsController = ParcelsController();

  bool _isLoading = true;
  void _getData() async {
    _showNewOrderModel = await _newOrderController.getNewOderData(orderID: widget.orderID);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.parcelsAndDetails.tr(),
          style: TextStyle(fontFamily: 'dinnextl bold'),
        ),
      ),
      body: _isLoading
          ? SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            )
          : ListView.builder(
              itemCount: _showNewOrderModel.data.length,
              itemBuilder: (_, index) => LayoutBuilder(
                builder: (context, _) => Card(
                  margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                  elevation: 7,
                  color: kBackgroundColor,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    height: height * 0.3,
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.15,
                          color: kBackgroundColor,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/images/flag_icon.png',
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/arrow_arabic_icon.png',
                                      ),
                                      Positioned(
                                        left: 20,
                                        top: 19,
                                        //'Km 6.38'
                                        child: Text(
                                          (_showNewOrderModel.data[index].branchtoId) == null
                                              ? " 0.00 " + LocaleKeys.km.tr()
                                              : _showNewOrderModel.data[index].branchtoId,
                                          style: TextStyle(
                                            fontFamily: 'dinnextl bold',
                                            fontSize: 7,
                                            color: kHomeColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/location_icon.png',
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/arrow_arabic_icon.png',
                                      ),
                                      Positioned(
                                        right: 20,
                                        top: 19,
                                        child: Text(
                                          (_showNewOrderModel.data[index].branchfromId.toString()) == null
                                              ? " 0.00 " + LocaleKeys.km.tr()
                                              : _showNewOrderModel.data[index].branchfromId.toString() + " " + LocaleKeys.km.tr(),
                                          style: TextStyle(
                                            fontFamily: 'dinnextl bold',
                                            fontSize: 7,
                                            color: kHomeColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/follow_icon.png',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    LocaleKeys.deliverSite.tr(),
                                    style: TextStyle(fontFamily: 'dinnextl bold', fontSize: 14),
                                  ),
                                  Text(
                                    LocaleKeys.locationOfReceipt.tr(),
                                    style: TextStyle(fontFamily: 'dinnextl bold', fontSize: 14),
                                  ),
                                  Text(
                                    LocaleKeys.youMandoub.tr(),
                                    style: TextStyle(fontFamily: 'dinnextl bold', fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.15,
                          width: width,
                          color: kHomeColor,
                          child: Container(
                            margin: EdgeInsets.only(top: 18, bottom: 18),
                            child: CustomButton(
                              onPressed: () {
                                print(_showNewOrderModel.data[index].id);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ParcelsMap(
                                              packageID: _showNewOrderModel.data[index].id,
                                            )));
                              },
                              title: LocaleKeys.parcelDetails.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
