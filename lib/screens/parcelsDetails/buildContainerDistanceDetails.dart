import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class BuildContainerDistanceDetails extends StatefulWidget {
  @override
  _BuildContainerDistanceDetailsState createState() => _BuildContainerDistanceDetailsState();
}

class _BuildContainerDistanceDetailsState extends State<BuildContainerDistanceDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height*0.1,),
        buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.captainName.tr(),user: LocaleKeys.ahmedAlmorsehdy.tr() ),
        SizedBox(height: height*0.01,),
        buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.dateOf.tr(),user: "25/5/1442" ),
        SizedBox(height: height*0.01,),
        buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.orderNumber.tr(),user: "1234567899" ),
        SizedBox(height: height*0.01,),
        buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.status.tr(),user: LocaleKeys.underWay.tr() ),
        SizedBox(height: height*0.01,),
        buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.parcelValue.tr(),user: "700 RAS" ),
        SizedBox(height: height*0.1,),
        Container(margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Image.asset("assets/images/messages.png",),
                SizedBox(width: width*0.05,),
                Text(LocaleKeys.chat.tr(),style: TextStyle(color: kTextColor,fontFamily: "dinnextl medium",fontSize: 16),),
              ],
            )),
        SizedBox(height: height*0.1,),

//dateOf
      ],
    );
  }

  Container buildContainer({double heightCon, double widthCon , String captainName , String user }) {
    return Container(
        height: heightCon,
        width: widthCon,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kHomeColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Text(captainName,style: TextStyle(fontFamily: "dinnextl medium"),),
          Text(user,style: TextStyle(fontFamily: "dinnextl medium",color: kTextColor,fontSize: 12),),

        ],),
      );
  }
}
