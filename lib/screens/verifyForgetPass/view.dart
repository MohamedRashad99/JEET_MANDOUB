import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/forgetPassword/Data/controller.dart';
import 'package:jeet/screens/verifyForgetPass/Data/controller.dart';
import 'package:jeet/widgets/smallButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerifyForgetPass extends StatefulWidget {
  var forgeNum;
  VerifyForgetPass({this.forgeNum});
  @override
  _VerifyForgetPassState createState() => _VerifyForgetPassState();
}

class _VerifyForgetPassState extends State<VerifyForgetPass> {
  TextEditingController controller = TextEditingController(text: "");
  int pinLength = 4;
  bool hasError = false;
  bool isLoading = false;
  bool isLoadingResend = false;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String code;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.receiveCode.tr()),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key:_globalKey ,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    "assets/images/vaCode.png",
                    height: height * 0.3,
                    width: width * 0.6,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: height*0.03,),
                Text(LocaleKeys.verfiyCodesend.tr(),style: TextStyle(fontSize: 16, fontFamily: "dinnextl bold",)),
                SizedBox(height: height*0.02,),
                PinCodeTextField(
                  autofocus: true,
                  controller: controller,
                  // hideCharacter: true,
                  highlight: true,
                  defaultBorderColor:kPrimaryColor,
                  pinBoxRadius: 7,
                  maxLength: pinLength,
                  hasError: hasError,
                  // maskCharacter: "😎",
                  onTextChanged: (text) {
                    setState(() {
                      hasError = false;
                    });
                  },
                  onDone: (text) {
                    print("DONE $text");
                    print("DONE CONTROLLER ${controller.text}");
                  },
                  pinBoxWidth: 50,
                  pinBoxHeight: 64,
                  //hasUnderline: true,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:
                  ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 22.0),
                  pinTextAnimatedSwitcherTransition:
                  ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                  pinTextAnimatedSwitcherDuration:
                  Duration(milliseconds: 300),
//                    highlightAnimation: true,
                  highlightAnimationBeginColor: Colors.black,
                  highlightAnimationEndColor: Colors.white12,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: height*0.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallButton(onPressed: (){
                      setState(() {
                        isLoadingResend = true;
                      });
                      ForgetPassController().ForgetPass_post(num: widget.forgeNum,context: context).then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    }, title: LocaleKeys.resend.tr(),color: kPrimaryColor,isLoading: isLoadingResend,),

                    SmallButton(onPressed: (){
                      setState(() {
                        isLoading = true;
                      });
                      VForgetPassController().VForgetPass_post(context: context,phone:widget.forgeNum ,Vcode:controller.text ).then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    }, title: LocaleKeys.confirmation.tr(),isLoading: isLoading,loadingColor: kPrimaryColor,),

                  ],
                ),
              ],

            ),



          ],
        ),
      ),
    );
  }
}
