import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';

class RecTabBar extends StatelessWidget {
  final TabController controller;

  RecTabBar(this.controller);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.28,
      child: TabBar(
        controller: controller,
        indicatorColor: kPrimaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        unselectedLabelColor: Colors.black,
        labelColor: kPrimaryColor,
        isScrollable: true,
        tabs: [
          TextButton(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical:40),
              child: Column(
                children: [
                  SizedBox(height:height*.06,child: Image.asset("assets/images/onWay.png")),
                  SizedBox(height:15,),
                  Text(LocaleKeys.underWay.tr(),
                    style: TextStyle(
                      fontFamily: "dinnextl bold",
                      color: Colors.black,
                      fontSize:14,),),
                ],
              ),
            ),
          ),
          TextButton(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical:40),
              child: Column(
                children: [
                  SizedBox(height:height*.06,child: Image.asset("assets/images/done.png")),
                  SizedBox(height:15,),
                  Text(LocaleKeys.done.tr(),
                    style: TextStyle(
                      fontFamily: "dinnextl bold",
                      color: Colors.black,
                      fontSize:14,),),
                ],
              ),
            ),
          ),
          TextButton(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 0,vertical:25),
              child: Column(
                children: [
                  SizedBox(height:height*.06,child: Image.asset("assets/images/bk.png")),
                  SizedBox(height:15,),
                  Container(
                    width: height*.14,
                    child: Text(LocaleKeys.bounced.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "dinnextl bold",
                        color: Colors.black,
                        fontSize:14,),),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 0,vertical:25),
              child: Column(
                children: [
                  SizedBox(height:height*.06,child: Image.asset("assets/images/onR.png")),
                  SizedBox(height:15,),
                  Container(
                    width: height*.14,
                    child: Text(LocaleKeys.paymentRequest.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "dinnextl bold",
                        color: Colors.black,
                        fontSize:14,),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
