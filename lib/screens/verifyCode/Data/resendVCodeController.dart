import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';



class ResendSignVcode{
  NetWork _netWork = NetWork();



  Future ResendVcode_post({context}) async{
    var provider = Provider.of<SignUpProvider>(context,listen: false);

    Map<String,dynamic>_body ={
      "phone":"+966${provider.signUpNum}",
    };
    FormData _formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'resendPhoneVerify',
        formData: _formData,
        headers: {
          "Content-Type":"application/json",
          "Accept":"application/json",
        }
    );
    // if(response){}
    response.then((value) {
      if(value['msg'] == "error"){
        print("Error");
        Fluttertoast.showToast(
            msg: "${LocaleKeys.noNetwork.tr()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else if(value['msg'] == "success" && value['data']== 'wait before resend'){
        Fluttertoast.showToast(
            msg: "${value['data']}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
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
      print("${value}");
    }
    );

    return response;
  }
}