import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jeet/screens/Congratulations/congratualtions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/network/network.dart';
import 'package:jeet/screens/personalInfo/Data/signUpProfileModel.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jeet/constants.dart';
import 'package:path/path.dart';
import '../../../constants.dart';

class CompleteDataController{
  NetWork _netWork = NetWork();

  Future CompleteData(context)async{
    var provider = Provider.of<SignUpProvider>(context,listen: false);
    ProfileModel _profileModel = ProfileModel();

    savePref(String token)async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", token);
      print(preferences.getString("token"));
    }
    Map<String,dynamic> _body = {
      "email":"${provider.email}",
      "city_id":"${provider.cityId}",
      "car_id":"${provider.carId}",
      "password":"${provider.password}",
      "password confirmation":"${provider.confirmPass}",
      "name":"${provider.userName}",
      "name_en":"${provider.userName}",
      "id_number":"${provider.idNumber}",
      "plate_number":"${provider.platNum}",
      "lat":"${provider.lat}",
      "lng":"${provider.lng}",
      "address":"${provider.location}",
      "license_expire_date":"${provider.licenseExpireDate}",
      "id_image":await MultipartFile.fromFile(provider.id_image.path,filename: basename(provider.id_image.path)),
      "license_image":await MultipartFile.fromFile(provider.license_image.path),
      "insurance_image":await MultipartFile.fromFile(provider.insurance_image.path),
      "back_image":await MultipartFile.fromFile(provider.backCameraImage.path),
      "front_image":await MultipartFile.fromFile(provider.frontCameraImage.path),
      "image":await MultipartFile.fromFile(provider.prof_image.path),

    };
    var formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'completedeliverydata',
    formData: formData,
    headers: {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer ${provider.token}"
    });
    // _profileModel = ProfileModel.fromJson(response);
    response.then((value){
      print(value['data']['email'] != null);
      print(value['msg']);
      if(value['msg']=='success'){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CongratualtionsView()));
        print("success${value['data']['delivery']['api_token']}");
        savePref("${value['data']['delivery']['api_token']}");
      }else if(value['data']['password'] != null && value['msg']=='error'){
        print("password${value}");
        Fluttertoast.showToast(
            msg: "${LocaleKeys.conPasswordE.tr()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else if(value['msg']=='error' && value['data']['email'] != null){
        print("emailWrong${value}");
        Fluttertoast.showToast(
            msg: LocaleKeys.usedEmail.tr(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
    print("${response}pppppppppppppppppp");
    return response;
  }
}