import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/parcelsDetails/Data/Controller.dart';
import 'package:jeet/screens/parcelsDetails/Data/Model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';

class ParcelsStatus extends StatefulWidget {
  @override
  _ParcelsStatusState createState() => _ParcelsStatusState();
}

class _ParcelsStatusState extends State<ParcelsStatus> {
  ParcelsModel _parcelsModel = ParcelsModel();
  ParcelsController _parcelsController = ParcelsController();
  bool _isLoading = true;
  void _getData() async {
    _parcelsModel = await _parcelsController.getParcelsData(packageID: _parcelsModel.data.id); //packageID: _parcelsModel.data.id
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  final GlobalKey scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          LocaleKeys.parcelsAndDetails.tr(),
          style: TextStyle(fontFamily: 'dinnextl bold', fontSize: 20),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: _isLoading
          ? SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      buildContainer(
                          heightCon: height * 0.08,
                          widthCon: width * 0.85,
                          captainName: LocaleKeys.captainName.tr(),
                          user: _parcelsModel.data.userName),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      buildContainer(heightCon: height * 0.08, widthCon: width * 0.85, captainName: LocaleKeys.dateOf.tr(), user: "13-3-2021"),

                      SizedBox(
                        height: height * 0.01,
                      ),
                      buildContainer(
                          heightCon: height * 0.08, widthCon: width * 0.85, captainName: LocaleKeys.orderNumber.tr(), user: _parcelsModel.data.code),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      buildContainer(
                          heightCon: height * 0.08,
                          widthCon: width * 0.85,
                          captainName: LocaleKeys.status.tr(),
                          user: (_parcelsModel.data.status == 0)
                              ? LocaleKeys.underWay.tr()
                              : (_parcelsModel.data.status == 1)
                                  ? LocaleKeys.withDel.tr()
                                  : (_parcelsModel.data.status == 2)
                                      ? LocaleKeys.done.tr()
                                      : (_parcelsModel.data.status == 3)
                                          ? LocaleKeys.orderCanceled.tr()
                                          : (_parcelsModel.data.status == 4)
                                              ? LocaleKeys.bounce.tr()
                                              : ""),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      buildContainer(
                          heightCon: height * 0.08,
                          widthCon: width * 0.85,
                          captainName: LocaleKeys.parcelValue.tr(),
                          user: _parcelsModel.data.price.toString()),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/messages.png",
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Text(
                                LocaleKeys.chat.tr(),
                                style: TextStyle(color: kTextColor, fontFamily: "dinnextl medium", fontSize: 16),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: height * 0.1,
                      ),

//dateOf
                    ],
                  ),
                  // BuildContainerForButton(),
                ],
              ),
            ),
    );
  }

  Container buildContainer({double heightCon, double widthCon, String captainName, String user}) {
    return Container(
      height: heightCon,
      width: widthCon,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            captainName,
            style: TextStyle(fontFamily: "dinnextl medium"),
          ),
          Text(
            user,
            style: TextStyle(fontFamily: "dinnextl medium", color: kTextColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
