import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/parcelsDetails/my_map.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:easy_localization/easy_localization.dart';
class ParcelDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  LayoutBuilder(
      builder: (context, _) => Card(margin: EdgeInsets.only(top: 20,left: 15,right: 15),
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

                        Image.asset('assets/images/flag_icon.png',),
                        Stack(
                          children: [
                            Image.asset('assets/images/arrow_arabic_icon.png',),

                            Positioned(
                              left: 20,
                              top: 19,
                              child: Text(
                                'Km 6.38',
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
                            Image.asset('assets/images/location_icon.png',),
                          ],
                        ),

                        Stack(
                          children: [
                            Image.asset('assets/images/arrow_arabic_icon.png',),

                            Positioned(
                              right: 20,
                              top: 19,
                              child: Text(
                                'Km 6.38',
                                style: TextStyle(
                                  fontFamily: 'dinnextl bold',
                                  fontSize: 7,
                                  color: kHomeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(children: [
                          Image.asset('assets/images/follow_icon.png',),

                        ],),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            LocaleKeys.deliverSite.tr(),
                          style: TextStyle(
                              fontFamily: 'dinnextl bold',
                              fontSize: 14),
                        ),
                        Text(
                          LocaleKeys.locationOfReceipt.tr(),
                          style: TextStyle(
                              fontFamily: 'dinnextl bold',
                              fontSize: 14),
                        ),
                        Text(
                          LocaleKeys.youMandoub.tr(),
                          style: TextStyle(
                              fontFamily: 'dinnextl bold',
                              fontSize: 14),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              // btn
              Container(
                height: height * 0.15,
                width: width,
                color: kHomeColor,
                child: Container(

                  margin: EdgeInsets.only(
                      top: 18, bottom: 18),
                  child: CustomButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ParcelsMap()));
                  }, title: LocaleKeys.parcelDetails.tr(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
