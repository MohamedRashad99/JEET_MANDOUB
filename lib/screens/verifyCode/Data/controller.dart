import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:jeet/screens/vehicleSelection/view.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';



class SignVcode{
  NetWork _netWork = NetWork();



  Future Vcode_post({String Vcode,context}) async{
    var provider = Provider.of<SignUpProvider>(context,listen: false);

    Map<String,dynamic>_body ={
    "phone":"+966${provider.signUpNum}",
    "code":"${Vcode}"
    };
    FormData _formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'phoneVerify',
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
    msg: "${LocaleKeys.wrongVerificationNumber.tr()}",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: kPrimaryColor,
    textColor: Colors.white,
    fontSize: 16.0
    );
    }else{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectVehicle()));
      print("success");
    }
    print("${value}");
    }
);

    return response;
  }
}