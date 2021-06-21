import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../constants.dart';


class WallTabBar extends StatelessWidget {
  final TabController controller;

  WallTabBar(this.controller);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.18,
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
                  Text(LocaleKeys.all.tr(),
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
              padding: EdgeInsets.symmetric(horizontal: 0,vertical:40),
              child: Column(
                children: [
                  Text(LocaleKeys.charge.tr(),
                    textAlign: TextAlign.center,
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
              padding: EdgeInsets.symmetric(horizontal: 0,vertical:40),
              child: Column(
                children: [
                  Text(LocaleKeys.withdraw.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "dinnextl bold",
                      color: Colors.black,
                      fontSize:14,),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
