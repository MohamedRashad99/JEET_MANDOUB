import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/changePassword/view.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';

class VForgetPassController {
  NetWork _netWork = NetWork();

  Future VForgetPass_post({String Vcode, var phone, context}) async {
    print(phone);

    Map<String, dynamic> _body = {"phone": "+966${phone}", "code": "${Vcode}"};
    FormData _formData = FormData.fromMap(_body);
    print(_formData.fields);
    var response = _netWork.postData(url: 'verifyForgetPassword', formData: _formData, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    // if(response){}
    response.then((value) {
      if (value['msg'] == "error") {
        print("Error");
        Fluttertoast.showToast(
            msg: "${LocaleKeys.wrongVerificationNumber.tr()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangePass(
                      phoneNum: phone,
                    )));
        print("success");
      }
      print("${value}");
    });

    return response;
  }
}
