import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/ImagePicker/image_picker.dart';
import 'package:jeet/screens/personalInfo/Data/controller.dart';

import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:jeet/screens/home/Data/profileControl.dart';
import 'package:jeet/screens/home/Data/profileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileModel _profileModel = ProfileModel();
  ProfileGetData _profileGetData = ProfileGetData();

  bool loading = true;
  Future _getProData() async {
    _profileModel = await _profileGetData.getProfileData();
    setState(() {
      loading = false;
    });
  }

  void initState() {
    _getProData();
    super.initState();
  }
bool isLoading = true;
  File image;
  File image2;
  File idNumberImge;
  File frontCameraImage;
  File backCameraImage;
  File expirationImage;

  final picker = ImagePicker();
  Future<File> imageMedthod() async {
    File returnImage = await TakeImage.imageFile(context);
    if (returnImage != null) {
      return File(returnImage.path);
    } else {
      print("errooooooooooooooor");
    }
  }



  Future<String> getImageFromLocaleCache() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("image");
  }

  Widget buildImage() {
    return FutureBuilder<String>(
        future: getImageFromLocaleCache(),
        builder: (_, snap) {
          if (snap.hasData && snap.data != null) {
            return CircleAvatar(
              maxRadius: 40,
              backgroundImage: NetworkImage(
                  "https://jeeet.net/public/dash/assets/img/" + snap.data),
              child: Center(),
            );
          }
          print('line 99 err ');
          return Text('false');
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.editProfile.tr()),
      ),
      body: loading
          ? SpinKitChasingDots(
              size: 20,
              color: kPrimaryColor,
            )
          : Container(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    GestureDetector(
                      onTap: () async {
                        image = await imageMedthod();
                        setState(() {});
                      },
                      child:  CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: image == null ? null : FileImage(image),
                        child: Center(
                          child: image == null
                              ? Icon(
                            Icons.camera_alt_outlined,
                          )
                              : buildImage(),
                        ),
                      ),

                    /*  CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: image == null ? null : FileImage(image),
                        child: Center(
                          child: image == null
                              ? Icon(
                            Icons.camera_alt_outlined,
                          )
                              : Container(),
                        ),
                      ),*/
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(LocaleKeys.editProfile.tr(), style: TextStyle(fontFamily: "dinnextl bold", fontSize: 18)),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomTextField(
                      onTap: () {},
                      hint: _profileModel.data.delivery.name.toString(),
                      dIcon: Icons.person_add,
                      eIcon: Icons.edit,
                    ),
                    CustomTextField(
                      onTap: () {},
                      hint: _profileModel.data.delivery.email.toString(),
                      dIcon: Icons.email,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.8,
                      decoration: BoxDecoration(color: kHomeColor, borderRadius: BorderRadius.circular(3)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Image.asset(
                              "assets/images/flag.png",
                              height: height * 0.05,
                              width: width * 0.1,
                            ),
                          ),
                          Text(_profileModel.data.delivery.phone.toString(),
                              style: TextStyle(fontSize: 14, fontFamily: "dinnextl regular", color: kTextColor)),
                          SizedBox(
                            width: width * 0.2,
                          ),
                          Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      onTap: () {},
                      hint: _profileModel.data.delivery.cityName.toString(),
                      icon: Icons.location_on_outlined,
                      dIcon: Icons.location_on_outlined,
                    ),
                    CustomTextField(
                      onTap: () {},
                      hint: _profileModel.data.delivery.id.toString(),
                      dIcon: Icons.perm_identity_outlined,
                    ),
                    CustomTextField(
                      onTap: () {},
                      hint: _profileModel.data.delivery.carId.toString(),
                      dIcon: Icons.car_repair,
                    ),
                    CustomTextField(
                      onTap: () {},
                      hint: _profileModel.data.delivery.editCommericalIdnumber.toString(),
                      dIcon: Icons.edit,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            image2 = await imageMedthod();
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: kHomeColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: height * 0.12,
                              width: width * 0.35,
                              child: image2 == null
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          color: kTextColor,
                                        ),
                                        Center(
                                            child: Text(
                                          LocaleKeys.imageForCarLicence.tr(),
                                          style: TextStyle(fontFamily: "dinnextl regular", color: kTextColor, fontSize: 12),
                                          textAlign: TextAlign.center,
                                        )),
                                      ],
                                    )
                                  : ClipRRect(
                                      child: Image.file(
                                        image2,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8))),
                        ),
                        GestureDetector(
                          onTap: () async {
                            idNumberImge = await imageMedthod();
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(color: kHomeColor, borderRadius: BorderRadius.circular(8)),
                              height: height * 0.12,
                              width: width * 0.35,
                              child: idNumberImge == null
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          color: kTextColor,
                                        ),
                                        Text(
                                          LocaleKeys.idNumber.tr(),
                                          style: TextStyle(fontFamily: "dinnextl regular", color: kTextColor, fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      child: Image.file(
                                        idNumberImge,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            frontCameraImage = await imageMedthod();
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(color: kHomeColor, borderRadius: BorderRadius.circular(8)),
                              height: height * 0.12,
                              width: width * 0.35,
                              child: frontCameraImage == null
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          color: kTextColor,
                                        ),
                                        Text(
                                          LocaleKeys.imageCarFront.tr(),
                                          style: TextStyle(fontFamily: "dinnextl regular", color: kTextColor, fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      child: Image.file(
                                        frontCameraImage,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8))),
                        ),
                        GestureDetector(
                          onTap: () async {
                            backCameraImage = await imageMedthod();
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(color: kHomeColor, borderRadius: BorderRadius.circular(8)),
                              height: height * 0.12,
                              width: width * 0.35,
                              child: backCameraImage == null
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          color: kTextColor,
                                        ),
                                        Text(
                                          LocaleKeys.imageCarBack.tr(),
                                          style: TextStyle(fontFamily: "dinnextl regular", color: kTextColor, fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      child: Image.file(
                                        backCameraImage,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.licencExpirationDate.tr(),
                          style: TextStyle(fontFamily: "dinnextl bold", fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        GestureDetector(
                          onTap: () async {
                            expirationImage = await imageMedthod();
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                              height: height * 0.06,
                              width: width * 0.15,
                              child: Container(
                                child: expirationImage == null
                                    ? Icon(
                                        Icons.camera_alt_outlined,
                                        color: kTextColor,
                                      )
                                    : ClipRRect(
                                        child: Image.file(
                                          expirationImage,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomButton(
                      /* onPressed: () {

                            CompleteDataController()
                                .CompleteData(context)
                                .then((value) {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          } ,*/

                        title: LocaleKeys.save.tr()),
                    SizedBox(
                      height: height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
