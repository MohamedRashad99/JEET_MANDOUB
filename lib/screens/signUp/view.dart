import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/screens/login/view.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:provider/provider.dart';

import 'Data/controller.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading= false;
  final _numController = TextEditingController();

  @override
  void dispose() {
    _numController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var provider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.signup.tr()),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.05,),
              Align(alignment:Alignment.topCenter ,child: Text(LocaleKeys.youneedtoreg.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl medium", color: kTextColor,),)),
              SizedBox(height: height*0.05,),

              Container(
                height: height*0.07,
                width: width*0.8,
                decoration: BoxDecoration( color: kHomeColor,borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/images/flag.png",height: height*0.05,width: width*0.1, ),
                  ),
                  Text("+966",style: TextStyle(fontFamily: "dinnextl bold",color: kPrimaryColor),),
                    SizedBox(width: width*0.05,),
                  Expanded(
                    child: TextFormField(

                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none
                      ),
                        style: TextStyle(fontSize: 14,fontFamily: "dinnextl regular",
                            color: kTextColor),
                      keyboardType: TextInputType.phone,
                      validator: (v){
                        if(v.isEmpty){
                          return LocaleKeys.enterYourPhoneNum.tr();
                        }else if(v.length<9 || v.length >9){
                          return context.locale == Locale('en', 'US')?"Phone number should be 9 numbers":"لابد من ادخال رقم مكون من 9 ارقام";
                        }
                        return null;
                      },
                      onChanged: (v){
                        provider.signUpNum = v;
                      },
                      controller: _numController,
                    ),
                  ),
                ],),

              ),
              SizedBox(height: height*0.01,),
             Container(
               height: height*0.55,
               width: width*0.8,
               //color: kHomeColor,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("${LocaleKeys.alreadyHaveAnAccount.tr()}\t",style: TextStyle(fontFamily: "dinnextl regular",color: kTextColor),),
                       GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                           },
                           child: Text(LocaleKeys.login.tr(),style: TextStyle(color: Colors.red,fontFamily: "dinnextl regular"),)),
                     ],
                   ),
                   SizedBox(height: height*0.03,),
                  Text(LocaleKeys.registrationReq.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl bold",)),
                   SizedBox(height: height*0.01,),
                   Text(LocaleKeys.personalPic.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl medium",)),
                   Text(LocaleKeys.providerpersonaal.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl medium",)),
                   Text(LocaleKeys.emailAdd.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl medium",)),
                   Text(LocaleKeys.vehicleInfo.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl medium",)),
                   Text(LocaleKeys.vehiclePic.tr(),style: TextStyle(fontSize: 16 , fontFamily: "dinnextl medium",)),

                 ],
               ),
             ),
              CustomButton(
                isLoading: isLoading,
                title: LocaleKeys.signup.tr(),
                color: kPrimaryColor,
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    setState(() {
                      isLoading = true;
                    });
                    SignUp_post().PostNum(context).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  }else{
                    print("nooooo");
                  }

                },
              ),





            ],
          ),
        ),
      ),
    );
  }
}
