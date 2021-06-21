import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool isSwitchedAr ;
  bool isSwitchedEn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(  context.locale == Locale('en', 'US')){
      setState(() {
        isSwitchedEn = true;
        isSwitchedAr = false;
      });

    }else{
      isSwitchedEn = false;
      isSwitchedAr = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Text(
          LocaleKeys.language.tr(),
          style: TextStyle(fontFamily: 'dinnextl bold'),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body:Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
        padding:  EdgeInsets.symmetric(horizontal: 22),
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(height: height*0.07,),
            Container(
              height: height*0.08,
              width: width*0.9,
              decoration: BoxDecoration(color: kHomeColor,borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Switch(
                    activeColor: kPrimaryColor,
                    activeTrackColor: kPrimaryColor,
                    value: isSwitchedEn,
                    onChanged: (bool val){
                      setState(() {
                        isSwitchedEn=val;
                        if(isSwitchedEn == true){
                          context.locale = Locale('en', 'US');
                          isSwitchedAr = false;
                        }else{
                          context.locale = Locale('ar', 'EG');
                          isSwitchedAr = true;
                        }
                      });
                    },
                  ),
                  SizedBox(width: width*0.2,),
                  Text("English",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              height: height*0.08,
              width: width*0.9,
              decoration: BoxDecoration(color: kHomeColor,borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Switch(
                      activeColor:kPrimaryColor,
                      activeTrackColor: kPrimaryColor,
                      value: isSwitchedAr,
                      onChanged: (bool value){

                        setState(() {
                          isSwitchedAr=value;
                          if(isSwitchedAr == true){
                            context.locale = Locale('ar', 'EG');
                            isSwitchedEn = false;
                          }else{
                            context.locale = Locale('en', 'US');
                            isSwitchedEn = true;
                          }
                        });

                      }
                  ) ,
                  SizedBox(width: width*0.2,),
                  Text("عربى",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 16),),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
