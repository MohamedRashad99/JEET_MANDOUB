import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  var signUpNum;
  var token;
  var carPrice;
  var carName;
  var carEnName;
  var carId;

  //personal infos
  var userName;
  var licenseExpireDate;
  var cityId;
  var password;
  var confirmPass;
  var idNumber;
  var platNum;
  var email;
  var location;
  var lat;
  var lng;

  File prof_image;
  File license_image;
  File id_image;
  File frontCameraImage;
  File backCameraImage;
  File insurance_image;

  void setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }
}
