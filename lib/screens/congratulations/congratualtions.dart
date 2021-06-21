import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/screens/home/view.dart';

class CongratualtionsView extends StatefulWidget {
  @override
  _CongratualtionsViewState createState() => _CongratualtionsViewState();
}

class _CongratualtionsViewState extends State<CongratualtionsView> {
  /* double height = MediaQuery.of(ctx).size.height;
  double width = MediaQuery.of(ctx).size.width;*/

  @override
  Widget build(BuildContext context) {
    void x() {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          Timer(Duration(seconds: 20), () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          });
          return Container(
            height: 400,
            width: 500,
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Image.asset(
                        "assets/images/waitClock.png",
                        width: 500,
                      ),
                      Text(
                        LocaleKeys.waitActivate.tr(),
                        style: TextStyle(fontFamily: "dinnextl bold", fontSize: 16),
                      )
                    ],
                  );
                }),
          );
        },
      );
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.congratulations.trim()),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Image.asset(
              "assets/images/cong.png",
            ),
            //wait
            Text(
              LocaleKeys.congratulations.tr(),
              style: TextStyle(fontFamily: "dinnextl bold", fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              child: Text(
                LocaleKeys.wait.tr(),
                style: TextStyle(fontFamily: "dinnextl medium", fontSize: 14, color: kTextColor),
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            CustomButton(
                onPressed: () {
                  x();
                },
                title: LocaleKeys.enter.tr()),
          ],
        ),
      ),
    );
  }
}
