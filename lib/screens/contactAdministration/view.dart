import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/widgets/customButton.dart';
class ContactWithAdministration extends StatefulWidget {
  @override
  _ContactWithAdministrationState createState() => _ContactWithAdministrationState();
}

class _ContactWithAdministrationState extends State<ContactWithAdministration> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(backgroundColor: kPrimaryColor,title: Text(LocaleKeys.contactWithAdmin.tr(),style: TextStyle(fontFamily: "dinnextl bold", fontSize: 18,)),),
      body: Container(
        height: height,
        width: width,

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.05,),
              Text(LocaleKeys.callUs.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 16)),
              SizedBox(height: height*0.05,),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(LocaleKeys.manageNumber.tr(),style: TextStyle(fontFamily: "dinnextl medium",fontSize: 16)),
                  Text("+96625416398",style: TextStyle(fontFamily: "dinnextl medium",fontSize: 16,color: kTextColor)),
                  Icon(Icons.phone),
                  Icon(Icons.phone_android_rounded),

                ],
              ),
              SizedBox(height: height*0.05,),
              Container(
                height: height*0.1,
                width: width*0.9,
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: kHomeColor ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Text(LocaleKeys.userName.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 16,color: kTextColor)),
                ),
              ),
              SizedBox(height: height*0.025,),
              Container(
                height: height*0.1,
                width: width*0.9,
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: kHomeColor ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Text(LocaleKeys.mobileNumber.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 16,color: kTextColor)),
                ),
              ),
              SizedBox(height: height*0.025,),
              Container(
                height: height*0.2,
                width: width*0.9,
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: kHomeColor ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Text(LocaleKeys.urComplaintOrSug.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 16,color: kTextColor)),
                ),
              ),
              SizedBox(height: height*0.1,),
              CustomButton(onPressed: (){}, title: LocaleKeys.send.tr()),

            ],
          ),
        ),
      ),
    );
  }
}

