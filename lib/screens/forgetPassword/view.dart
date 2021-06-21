import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/forgetPassword/Data/controller.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isLoading = false;
  var forgetNum;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title:Text( LocaleKeys.forgotPassword.tr()),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/forget.png"),
            Text( LocaleKeys.forgotPassword.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 35),),
            SizedBox(height: height*0.05,),
            CustomTextField(
             //controller:,
              dIcon: Icons.phone_android_rounded,
              label: true,
              type: TextInputType.number,
              hint: "${LocaleKeys.phone}",
              onsave: (v){
                forgetNum = v;
              },
            ),
            SizedBox(height: height*0.05,),
            CustomButton(
                isLoading: isLoading,
                onPressed: (){
                  setState(() {
                    isLoading = true;
                  });
                  ForgetPassController().ForgetPass_post(num: forgetNum,context: context).then((value) {
                    setState(() {
                      isLoading = false;
                    });
                  });
            }, title: LocaleKeys.send.tr()),
          ],

        ),
      ),
    );
  }
}
