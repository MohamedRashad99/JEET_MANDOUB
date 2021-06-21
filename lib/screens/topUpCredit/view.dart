import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/screens/bankTransfer/view.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';
import 'dart:io';

class TopUpCredit extends StatefulWidget {
  final int deliveryID;
  final File image;
  TopUpCredit({this.deliveryID, this.image});

  @override
  _TopUpCreditState createState() => _TopUpCreditState();
}

class _TopUpCreditState extends State<TopUpCredit> {
  @override
  Widget build(BuildContext context) {
    /********************** DialogFunctions   ***************************/
    void CuoponDialogFunction(){
      showModalBottomSheet(context: context, builder: (_){
        return AnimatedContainer(
          duration: Duration(seconds: 4,),
          child: Container(

            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(color: kBackgroundColor,borderRadius:BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)) ),
            child:Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.addCoupon.tr(),style: TextStyle(fontSize: 16,fontFamily: "dinnextl bold"),),
                  SizedBox(height: 15,),
                  Text(LocaleKeys.plsEnterYourCoupon.tr(),style: TextStyle(fontSize: 14,fontFamily: "dinnextl bold",color: kTextColor),),
                  SizedBox(height: 25,),
                 CustomTextField(onTap: (){},hint: LocaleKeys.enterCode.tr(),),
                  SizedBox(height: 25,),
                  CustomButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, title: LocaleKeys.check.tr()),

                ],),
              ),
            ),
          ),
        );
      },);


    }
    void RewardsDialogFunction(){
      showModalBottomSheet(context: context, builder: (_){
        return Container(

          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: kBackgroundColor,borderRadius:BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)) ),
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.rewards.tr(),style: TextStyle(fontSize: 16,fontFamily: "dinnextl bold"),),
                  SizedBox(height: 15,),
                  Text(LocaleKeys.addPoint.tr(),style: TextStyle(fontSize: 14,fontFamily: "dinnextl bold",color: kTextColor),),
                  SizedBox(height: 25,),
                  CustomTextField(onTap: (){},hint: LocaleKeys.avPoints.tr(),),
                  SizedBox(height: 25,),
                  CustomButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, title: LocaleKeys.continueStep.tr()),

                ],),
            ),
          ),
        );
      },);


    }
    /********************************   ***********************************/
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(backgroundColor: kPrimaryColor,title: Text(LocaleKeys.topUpCredit.tr()),),
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height*0.1,),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BankTransfer(image: widget.image,deliveryID: widget.deliveryID)),
                  );
            },
                child: buildContainer(widthContainer: width*0.8 , heightContainer: height*0.1,widthSizedBox: width*0.2, name: LocaleKeys.bankTr.tr())),
            SizedBox(height: height*0.02,),
            GestureDetector(
              onTap: (){
                CuoponDialogFunction();
              },
                child: buildContainer(widthContainer: width*0.8 , heightContainer: height*0.1,widthSizedBox: width*0.2, name: LocaleKeys.coupon.tr())),
            SizedBox(height: height*0.02,),
            GestureDetector(
              onTap: (){
                RewardsDialogFunction();
              }
            ,child: buildContainer(widthContainer: width*0.8 , heightContainer: height*0.1,widthSizedBox: width*0.2, name: LocaleKeys.rewards.tr())),


          ],
        ),
      ),
    );
  }

  Container buildContainer({double widthContainer, double heightContainer,double widthSizedBox ,String name}) {
    return Container(
          width: widthContainer,
            height:heightContainer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kHomeColor,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name,style: TextStyle(fontFamily: "dinnextl medium"),),
              SizedBox(width: widthSizedBox,),
              Icon(Icons.arrow_forward_ios,color: Colors.grey,)
            ],
          ),
        );
  }
}
