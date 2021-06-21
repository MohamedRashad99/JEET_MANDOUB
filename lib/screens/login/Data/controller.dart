import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/home/view.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jeet/constants.dart';
import '../../../constants.dart';
import 'package:jeet/global.dart'as globals;


class SignInController{
  NetWork _netWork = NetWork();

  Future SignIn({context,var num,var pass})async{
    var provider = Provider.of<SignUpProvider>(context,listen: false);

    savePref(String token)async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", token);
      print(preferences.getString("token"));
    }
    Map<String,dynamic> _body = {
      "phone":"+966${num}",
      "password":"${pass}",
    };
    var formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'login',
        formData: formData,);
    // _profileModel = ProfileModel.fromJson(response);
    response.then((value){
      print(value['data']);
      print(value['msg']);
      globals.uid=value['data']['user']['id'];
      print("UerID : ${globals.uid}");

      if(value['msg']=='success'){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen()));

        savePref("${value['data']['user']['api_token']}");

      provider.prof_image=null;
      provider.backCameraImage=null;
      provider.insurance_image=null;
      provider.license_image=null;
      provider.id_image=null;
      provider.frontCameraImage=null;
      provider.location=null;
      provider.lat=null;
      provider.lng=null;
      }else if(value['data'] == 'check your phone or password'){
        print("erfgegfe${value}");
        Fluttertoast.showToast(
            msg: "${LocaleKeys.incorrectCredentials.tr()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });

    return response;
  }
}