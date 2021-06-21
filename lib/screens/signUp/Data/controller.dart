


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/verifyCode/view.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider.dart';

class SignUp_post{
NetWork _netWork = NetWork();


Future PostNum(context)async{
  var provider = Provider.of<SignUpProvider>(context,listen: false);

  Map<String,dynamic>_body ={
    "phone":"+966${provider.signUpNum}",
  };
  FormData _formData = FormData.fromMap(_body);
  var response = _netWork.postData(url: 'deliveryregister',
      formData: _formData
      );
  // if(response){}
  final prefs = await SharedPreferences.getInstance();
  response.then((value) {
    value['data']['phone']!=null?print(value['data']['phone']):print("hh");
    if(value['msg']=='success'){//api_token


      //TODo MAX
    final image = value["data"]["user"]["image"];
      prefs.setString("image", image);
      provider.token = value['api_token'];
      print(provider.token);
      print(value['verifynumber']);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyCodeNumber()));
      Fluttertoast.showToast(
          msg: "${LocaleKeys.verificationCodeSentTo.tr()}: ${provider.signUpNum}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if(value['msg']=='error'||value['data']['phone']=='[The phone has already been taken.]'){
      Fluttertoast.showToast(
          msg: "${LocaleKeys.phoneNumberExist.tr()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    print("${value}");
  });
  return response;
}
}