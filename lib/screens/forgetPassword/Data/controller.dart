


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/verifyForgetPass/view.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetPassController{
  NetWork _netWork = NetWork();


  Future ForgetPass_post({context,var num}){
    print(num);

    Map<String,dynamic>_body ={
      "phone":"+966${num}",
    };
    FormData _formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'sendVerifyForgetPasswordNum',
        formData: _formData
    );
    // if(response){}
    response.then((value) {
      print( value['msg']);
      // value['data']['phone']!=null?print(value['data']['phone']):print("hh");
      if(value['msg']=='success'){//api_token
        print(value['data']['verifyNum']);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyForgetPass(forgeNum: num,)));
        Fluttertoast.showToast(
            msg: "${LocaleKeys.verificationCodeSentTo.tr()}: ${num}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else{
        Fluttertoast.showToast(
            msg: "${LocaleKeys.sorryPhoneIncorrect.tr()}",
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