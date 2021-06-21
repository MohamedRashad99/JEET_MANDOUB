import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/screens/changePassword/view.dart';
import 'package:jeet/screens/editProfile/view.dart';
import 'package:jeet/screens/login/view.dart';
import 'package:jeet/screens/setttings/termsAndCondition.dart';
import 'package:jeet/screens/setttings/ChangeLanguage/view.dart';
import 'package:jeet/screens/setttings/Rates/view.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Settings extends StatefulWidget {


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.settings.tr(),style: TextStyle(fontFamily: "dinnextl bold", fontSize: 18,)),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeLanguage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: width * 0.8,
                height: height * 0.09,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Icon(
                        Icons.language,
                        color: Colors.grey,
                      ),
                    ),
                    Text(LocaleKeys.language.tr(), style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16, color: kTextColor)),
                    SizedBox(
                      width: width * 0.3,
                    ),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: width * 0.8,
                height: height * 0.09,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                //Borg.png
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                    Text(LocaleKeys.editProfile.tr(), style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16, color: kTextColor)),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    // Icon(Icons.add_circle_outline_rounded,color: Colors.grey,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: width * 0.8,
                height: height * 0.09,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                //Borg.png
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                    Text(LocaleKeys.editProfile.tr(), style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16, color: kTextColor)),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    // Icon(Icons.add_circle_outline_rounded,color: Colors.grey,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Rates()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: width * 0.8,
                height: height * 0.09,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                //Borg.png
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Icon(
                        Icons.star_rate_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Text(LocaleKeys.review.tr(), style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16, color: kTextColor)),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    // Icon(Icons.add_circle_outline_rounded,color: Colors.grey,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: width * 0.8,
                height: height * 0.09,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                //Borg.png
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Icon(
                        Icons.accessibility_new,
                        color: Colors.grey,
                      ),
                    ),
                    Text(LocaleKeys.conditions.tr(), style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16, color: kTextColor)),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    // Icon(Icons.add_circle_outline_rounded,color: Colors.grey,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: width * 0.8,
                height: height * 0.09,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                //Borg.png
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Icon(
                        Icons.logout,
                        color: Colors.grey,
                      ),
                    ),
                    Text(LocaleKeys.logOut.tr(), style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16, color: kTextColor)),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    // Icon(Icons.add_circle_outline_rounded,color: Colors.grey,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
