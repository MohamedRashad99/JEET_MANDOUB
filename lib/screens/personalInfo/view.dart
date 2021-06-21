import 'package:flutter/material.dart';
import 'package:jeet/screens/ImagePicker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/personalInfo/Data/controller.dart';
import 'package:jeet/screens/personalInfo/Data/selectCityController.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import 'package:platform_date_picker/platform_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Data/selectCityModel.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  DateTime _time = DateTime.now();
  SelectCityModel _selectCityModel = SelectCityModel();
  var dropButton;
  var citiesList;
  var citiesListEn;
  LocationResult _pickedLocation;
  bool isLoading = false;
  final _passController = TextEditingController();
  final _passConfirmController = TextEditingController();
  final _userNController = TextEditingController();
  final _emailController = TextEditingController();
  final _idNumController = TextEditingController();
  final _platNumController = TextEditingController();
  final expDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final picker = ImagePicker();
  Future<File> imageMedthod() async {
    File returnImage = await TakeImage.imageFile(context);
    if (returnImage != null) {
      return File(returnImage.path);
    } else {
      print("errooooooooooooooor");
    }
  }

  bool loading = true;
  void getcities() async {
    _selectCityModel = await GetCityController().GetCity();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getcities();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _passConfirmController.dispose();
    _passController.dispose();
    _userNController.dispose();
    _emailController.dispose();
    _idNumController.dispose();
    _platNumController.dispose();
    super.dispose();
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
          }else{
            print('line 99 err ');
            return CircleAvatar(
              maxRadius: 40,
              backgroundColor: kPrimaryColor,
              child: Center(),
            );
          }

        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var provider = Provider.of<SignUpProvider>(context);
    // getcities();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.personalInfos.tr()),
      ),
      body: loading
          ? SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            )
          : Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                height: height,
                width: width,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        GestureDetector(
                          onTap: () async {
                            provider.prof_image = await imageMedthod();
                            setState(() {


                            });
                          },
                          child: buildImage(),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(LocaleKeys.profileImage.tr(),
                            style: TextStyle(
                                fontFamily: "dinnextl bold", fontSize: 18)),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        CustomTextField(
                          onsave: (v) {
                            provider.userName = v;
                          },
                          onTap: () {},
                          hint: LocaleKeys.userName.tr(),
                          dIcon: Icons.person_add,
                          controller: _userNController,
                          valid: qValidator([
                            // RegExpRule(''),
                            IsRequired(LocaleKeys.userName.tr()),
                          ]),
                        ),
                        CustomTextField(
                          onsave: (v) {
                            provider.email = v;
                          },
                          onTap: () {},
                          hint: LocaleKeys.email.tr(),
                          dIcon: Icons.email,
                          controller: _emailController,
                          valid: qValidator([
                            // RegExpRule(''),

                            IsRequired(LocaleKeys.eEmail.tr()),
                            IsEmail(LocaleKeys.invalidEmail.tr())
                          ]),
                        ),
                        CustomTextField(
                          onTap: () async {
                            LocationResult result = await showLocationPicker(
                              context,
                              "AIzaSyBU6YNVxesC2-qRF2yDgCk7be8QaQz56kQ",
                              initialCenter: LatLng(31.1975844, 29.9598339),
                              automaticallyAnimateToCurrentLocation: true,
                              mapStylePath: 'assets/mapStyle.json',
                              myLocationButtonEnabled: true,
                              requiredGPS: true,
                              layersButtonEnabled: true,
                              countries: ['sa', 'NG'],

                              resultCardAlignment: Alignment.bottomCenter,
//                             desiredAccuracy: LocationAccuracy.best,
                            );
                            print("result = $result");
                            setState(() {
                              _pickedLocation = result;
                              provider.location = _pickedLocation.address;
                              provider.lat = _pickedLocation.latLng.latitude;
                              provider.lng = _pickedLocation.latLng.longitude;
                            });
                          },
                          valid: (v) {
                            if (provider.location == null) {
                              return context.locale == Locale('ar', 'EG')
                                  ? 'Please enter your work branch'
                                  : "الرجاء ادخال عنوان العمل";
                            }
                          },
                          hint: provider.location == null
                              ? LocaleKeys.city.tr()
                              : provider.location,
                          dIcon: Icons.home_outlined,
                          icon: Icons.arrow_drop_down_outlined,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: DropdownButtonFormField(
                            validator: (v) {
                              if (v == null) {
                                return LocaleKeys.selectCity.tr();
                              }
                              return null;
                            },
                            value: dropButton,
                            onChanged: (val) {
                              setState(() {
                                dropButton = val;
                              });
                            },
                            items: _selectCityModel.data.map((value) {
                              return DropdownMenuItem(
                                value: context.locale == Locale('en', 'US')
                                    ? value.nameEn
                                    : value.name,
                                child: Text(
                                  context.locale == Locale('en', 'US')
                                      ? value.nameEn
                                      : value.name,
                                  style: TextStyle(
                                    fontFamily: "Cairo-Bold",
                                  ),
                                ),
                                onTap: () {
                                  provider.cityId = value.id;
                                  print(provider.cityId);
                                },
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              fillColor: Color(0xffffffff),
                              enabledBorder: InputBorder.none,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              labelText: "${LocaleKeys.cityName.tr()}",
                              labelStyle: TextStyle(
                                color: Color(0xffacacac),
                              ),
                            ),
                            dropdownColor: Color(0xffffffff),
                            elevation: 0,
                          ),
                        ),
                        // CustomTextField(onTap: (){},hint: LocaleKeys.city.tr(),icon:Icons.location_on_outlined, dIcon: Icons.location_on_outlined,),
                        CustomTextField(
                          onTap: () {},
                          onsave: (v) {
                            provider.password = v;
                          },
                          hint: LocaleKeys.password.tr(),
                          icon: Icons.lock_outline,
                          dIcon: Icons.lock_outline,
                          valid: qValidator([
                            // RegExpRule(''),

                            IsRequired(LocaleKeys.ePassword.tr()),
                            MinLength(6),
                          ]),
                          controller: _passController,
                        ),
                        CustomTextField(
                          onTap: () {},
                          onsave: (v) {
                            provider.confirmPass = v;
                          },
                          hint: LocaleKeys.confirmPass.tr(),
                          icon: Icons.lock_outline,
                          dIcon: Icons.lock_outline,
                          valid: qValidator([
                            // RegExpRule(''),
                            // if(provider.confirmPass != provider.password){
                            //     return LocaleKeys.passConfirmationInvalid.tr();
                            //     },
                            IsRequired(LocaleKeys.ePassword.tr()),
                            MinLength(6),
                            if (provider.password != null)
                              Match(provider.password)
                          ]),
                          controller: _passConfirmController,
                        ),
                        CustomTextField(
                          onTap: () {},
                          onsave: (v) {
                            provider.idNumber = v;
                          },
                          valid: qValidator([
                            // RegExpRule(''),

                            IsRequired(LocaleKeys.idNumberE.tr()),
                          ]),
                          hint: LocaleKeys.idNumberE.tr(),
                          dIcon: Icons.perm_identity_outlined,
                          controller: _idNumController,
                        ),
                        CustomTextField(
                          onTap: () {},
                          onsave: (v) {
                            provider.platNum = v;
                          },
                          hint: LocaleKeys.plateNumber.tr(),
                          dIcon: Icons.car_repair,
                          controller: _platNumController,
                          valid: qValidator([
                            // RegExpRule(''),

                            IsRequired(LocaleKeys.plateNumber.tr()),
                          ]),
                        ),
                        CustomTextField(
                          controller: expDateController,
                          onTap: () async {
                            DateTime date = await PlatformDatePicker.showDate(
                              context: context,
                              firstDate: DateTime(DateTime.now().year - 2),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 2),
                            );

                            if (date != null)
                              setState(() {
                                _time = date;
                                provider.licenseExpireDate =
                                    "${_time.year}-${_time.month}-${_time.day}";
                                print(provider.licenseExpireDate);
                                expDateController.text =
                                    provider.licenseExpireDate;
                              });
                          },
                          hint: provider.licenseExpireDate == null
                              ? LocaleKeys.licencExpirationDate.tr()
                              : provider.licenseExpireDate.toString(),
                          dIcon: Icons.car_rental,
                          valid: qValidator([
                            // RegExpRule(''),

                            IsRequired(LocaleKeys.licencExpirationDate.tr()),
                          ]),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                // image2 = await imageMedthod();
                                provider.license_image = await imageMedthod();

                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: kHomeColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: height * 0.12,
                                  width: width * 0.35,
                                  child: provider.license_image == null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              LocaleKeys.imageForCarLicence
                                                  .tr(),
                                              style: TextStyle(
                                                  fontFamily:
                                                      "dinnextl regular",
                                                  color: kTextColor,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            )),
                                          ],
                                        )
                                      : ClipRRect(
                                          child: Image.file(
                                            provider.license_image,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8))),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // idNumberImge = await imageMedthod();
                                provider.id_image = await imageMedthod();
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: kHomeColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: height * 0.12,
                                  width: width * 0.35,
                                  child: provider.id_image == null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              style: TextStyle(
                                                  fontFamily:
                                                      "dinnextl regular",
                                                  color: kTextColor,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          child: Image.file(
                                            provider.id_image,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8))),
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
                                // frontCameraImage = await imageMedthod();
                                provider.frontCameraImage =
                                    await imageMedthod();
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: kHomeColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: height * 0.12,
                                  width: width * 0.35,
                                  child: provider.frontCameraImage == null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              style: TextStyle(
                                                  fontFamily:
                                                      "dinnextl regular",
                                                  color: kTextColor,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          child: Image.file(
                                            provider.frontCameraImage,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8))),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // backCameraImage = await imageMedthod();
                                provider.backCameraImage = await imageMedthod();
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: kHomeColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: height * 0.12,
                                  width: width * 0.35,
                                  child: provider.backCameraImage == null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              style: TextStyle(
                                                  fontFamily:
                                                      "dinnextl regular",
                                                  color: kTextColor,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          child: Image.file(
                                            provider.backCameraImage,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8))),
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
                              LocaleKeys.imageOfInsur.tr(),
                              style: TextStyle(
                                  fontFamily: "dinnextl bold", fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            GestureDetector(
                              onTap: () async {
                                provider.insurance_image = await imageMedthod();
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: height * 0.06,
                                  width: width * 0.15,
                                  child: Container(
                                    child: provider.insurance_image == null
                                        ? Icon(
                                            Icons.camera_alt_outlined,
                                            color: kTextColor,
                                          )
                                        : ClipRRect(
                                            child: Image.file(
                                              provider.insurance_image,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),

                        CustomButton(
                            isLoading: isLoading,
                            onPressed: () {
                              if (_formKey.currentState.validate() &&
                                  provider.id_image != null &&
                                  provider.frontCameraImage != null &&
                                  provider.license_image != null &&
                                  provider.insurance_image != null &&
                                  provider.backCameraImage != null &&
                                  provider.prof_image != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                CompleteDataController()
                                    .CompleteData(context)
                                    .then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "${LocaleKeys.completeFields.tr()}",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: kPrimaryColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            title: LocaleKeys.confirm.tr()),
                        SizedBox(
                          height: height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
//     return FutureBuilder(
//       future: GetCityController().GetCity(),
//         builder: (context ,snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               print("none");
//               return Container(height: MediaQuery
//                   .of(context)
//                   .size
//                   .height / 1.5,
//                   child: Center(
//                     child: SpinKitChasingDots(
//                       size: 40,
//                       color: kPrimaryColor,
//                     ),));
//             case ConnectionState.active:
//             case ConnectionState.waiting:
//               return Container(
//                   height: height / 1.30, child: Container(height: MediaQuery
//                   .of(context)
//                   .size
//                   .height / 1.5,
//                   child: Center(
//                       child: SpinKitChasingDots(
//                         size: 40,
//                         color: kPrimaryColor,
//                       ))));
//             case ConnectionState.done:
//               return Scaffold(
//                 backgroundColor: kBackgroundColor,
//                 appBar: AppBar(backgroundColor: kPrimaryColor,
//                   title: Text(LocaleKeys.personalInfos.tr()),),
//                 body: Form(
//                   key: _formKey,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   child: Container(
//                     height: height,
//                     width: width,
//                     child: SingleChildScrollView(
//                       child: Container(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(height: height * 0.04,),
//                             GestureDetector(
//                               onTap: () async {
//                                 provider.prof_image = await imageMedthod();
//                                 setState(() {});
//                               },
//                               child: CircleAvatar(
//                                 maxRadius: 40,
//                                 backgroundImage: provider.prof_image == null ? null : FileImage(
//                                     provider.prof_image),
//                                 child: Center(child: provider.prof_image == null ? Icon(
//                                   Icons.camera_alt_outlined,) : Container(),),
//
//                               ),
//                             ),
//                             SizedBox(height: height * 0.01,),
//                             Text(LocaleKeys.profileImage.tr(), style: TextStyle(
//                                 fontFamily: "dinnextl bold", fontSize: 18)),
//                             SizedBox(height: height * 0.04,),
//                             CustomTextField(onsave: (v) {
//                               provider.userName = v;
//                             },
//                               onTap: () {},
//                               hint: LocaleKeys.userName.tr(),
//                               dIcon: Icons.person_add,
//                             controller: _userNController,
//                             valid: qValidator([// RegExpRule(''),
//                               IsRequired(msg:LocaleKeys.userName.tr()),
//                             ]),),
//                             CustomTextField(onsave: (v){
//                               provider.email = v;
//                             },
//                               onTap: () {},
//                               hint: LocaleKeys.email.tr(),
//                               dIcon: Icons.email,
//                             controller: _emailController,
//                               valid: qValidator([// RegExpRule(''),
//
//                                 IsRequired(msg:LocaleKeys.eEmail.tr()),
//                                 IsEmail(msg: LocaleKeys.invalidEmail.tr())
//                               ]),
//                             ),
//                             CustomTextField(
//                               onTap: () async {
//                               LocationResult result = await showLocationPicker(
//                                 context,
//                                 "AIzaSyBU6YNVxesC2-qRF2yDgCk7be8QaQz56kQ",
//                                 initialCenter: LatLng(
//                                     31.1975844, 29.9598339),
//                                 automaticallyAnimateToCurrentLocation: true,
//                                 mapStylePath: 'assets/mapStyle.json',
//                                 myLocationButtonEnabled: true,
//                                 requiredGPS: true,
//                                 layersButtonEnabled: true,
//                                 countries: ['sa', 'NG'],
//
//                                 resultCardAlignment: Alignment
//                                     .bottomCenter,
// //                             desiredAccuracy: LocationAccuracy.best,
//                               );
//                               print("result = $result");
//                               setState(() {
//                                 _pickedLocation = result;
//                                 provider.location = _pickedLocation.address;
//                                 provider.lat = _pickedLocation.latLng.latitude;
//                                 provider.lng = _pickedLocation.latLng.longitude;
//                               });
//
//                             },valid: (v){
//
//                               if(provider.location==null){
//
//                                 return context.locale == Locale('ar', 'EG')?'Please enter your work branch':"الرجاء ادخال عنوان العمل";
//
//                               }
//                             },
//                               hint: provider.location==null?LocaleKeys.city.tr():provider.location,
//                               dIcon: Icons.home_outlined,
//                               icon: Icons.arrow_drop_down_outlined,),
//                             Container(margin: EdgeInsets.symmetric(horizontal: 30),
//                               child: DropdownButtonFormField(
//                                 validator: (v){
//                                   if(v == null){
//                                     return LocaleKeys.selectCity.tr();
//                                   }
//                                   return null;
//                                 },
//
//                                 value: dropButton,
//
//                                 onChanged: (val) {
//                                   setState(() {
//                                     dropButton = val;
//                                   });
//                                 },
//
//                                 items: _selectCityModel.data.map((value) {
//                                   return DropdownMenuItem(
//
//                                     value: context.locale == Locale('en', 'US')
//                                         ? value
//                                         .nameEn
//                                         : value.name,
//
//                                     child: Text(
//                                       context.locale == Locale('en', 'US') ? value
//                                           .nameEn : value.name,
//                                       style: TextStyle(fontFamily: "Cairo-Bold",),),
//
//                                     onTap: () {
//                                       provider.cityId = value.id;
//                                       print(provider.cityId);
//                                     },
//
//                                   );
//                                 }).toList(),
//
//
//                                 decoration: InputDecoration(
//
//                                   fillColor: Color(0xffffffff),
//
//                                   enabledBorder: InputBorder.none,
//
//                                   filled: true,
//
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50)),
//
//                                   labelText: "${LocaleKeys.cityName
//                                       .tr()}",
//                                   labelStyle: TextStyle(
//
//                                     color: Color(0xffacacac),
//
//                                   ),
//
//                                 ),
//
//                                 dropdownColor: Color(0xffffffff),
//                                 elevation: 0,
//
//                               ),
//                             ),
//                             // CustomTextField(onTap: (){},hint: LocaleKeys.city.tr(),icon:Icons.location_on_outlined, dIcon: Icons.location_on_outlined,),
//                             CustomTextField(onTap: () {},
//                               onsave: (v){
//                                 provider.password = v;
//                               },
//                               hint: LocaleKeys.password.tr(),
//                               icon: Icons.lock_outline,
//                               dIcon: Icons.lock_outline,
//                             valid:qValidator([// RegExpRule(''),
//
//                               IsRequired(msg:LocaleKeys.ePassword.tr()),
//                               MinLength(6),
//                             ]),
//                             controller: _passController,),
//                             CustomTextField(onTap: () {},
//                               onsave: (v){
//                                 provider.confirmPass = v;
//                               },
//                               hint: LocaleKeys.confirmPass.tr(),
//                               icon: Icons.lock_outline,
//                               dIcon: Icons.lock_outline,
//                             valid:qValidator([// RegExpRule(''),
//                             // if(provider.confirmPass != provider.password){
//                             //     return LocaleKeys.passConfirmationInvalid.tr();
//                             //     },
//                               IsRequired(
//                                   msg:LocaleKeys.ePassword.tr()
//                               ),
//                               MinLength(6),
//                               if(provider.password!=null)
//                               Match(provider.password,ignoreCase: false)
//                             ]),controller: _passConfirmController,),
//                             CustomTextField(onTap: () {},
//                               onsave: (v){
//                                 provider.idNumber = v;
//                               },
//                               valid:qValidator([// RegExpRule(''),
//
//                                 IsRequired(msg:LocaleKeys.idNumberE.tr()),
//
//                               ]),
//                               hint: LocaleKeys.idNumberE.tr(),
//                               dIcon: Icons.perm_identity_outlined,
//                             controller: _idNumController,),
//                             CustomTextField(onTap: () {},
//                               onsave: (v){
//                                 provider.platNum = v;
//                               },
//                               hint: LocaleKeys.plateNumber.tr(),
//                               dIcon: Icons.car_repair,
//                             controller: _platNumController,
//                             valid: qValidator([// RegExpRule(''),
//
//                               IsRequired(msg:LocaleKeys.plateNumber.tr()),
//                             ]),
//                             ),
//                             CustomTextField(
//                               controller:expDateController,
//                               onTap: () async {
//                               DateTime date = await PlatformDatePicker.showDate(
//
//                                 context: context,
//
//                                   firstDate: DateTime(DateTime.now().year - 2),
//                                   initialDate: DateTime.now(),
//                                   lastDate: DateTime(DateTime.now().year + 2),
//                               );
//
//                               if (date != null) setState(() {
//                                 _time = date;
//                                 provider.licenseExpireDate = "${_time.year}-${_time.month}-${_time.day}";
//                                 print(provider.licenseExpireDate);
//                                 expDateController.text = provider.licenseExpireDate;
//                               });
//                             },
//                               hint: provider.licenseExpireDate == null
//                                   ? LocaleKeys.licencExpirationDate.tr()
//                                   : provider.licenseExpireDate.toString(),
//                               dIcon: Icons.car_rental,
//                             valid: qValidator([// RegExpRule(''),
//
//                               IsRequired(msg:LocaleKeys.licencExpirationDate.tr()),
//                             ]),),
//                             SizedBox(height: height * 0.04,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () async {
//                                     // image2 = await imageMedthod();
//                                       provider.license_image = await imageMedthod();
//
//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                       decoration: BoxDecoration(
//                                         color: kHomeColor,
//                                         borderRadius: BorderRadius
//                                             .circular(8),),
//                                       height: height * 0.12,
//                                       width: width * 0.35,
//                                       child: provider.license_image == null ? Column(
//                                         crossAxisAlignment: CrossAxisAlignment
//                                             .center,
//                                         children: [
//                                           SizedBox(height: height * 0.03,),
//                                           Icon(Icons.camera_alt_outlined,
//                                             color: kTextColor,),
//                                           Center(child: Text(
//                                             LocaleKeys.imageForCarLicence.tr(),
//                                             style: TextStyle(
//                                                 fontFamily: "dinnextl regular",
//                                                 color: kTextColor,
//                                                 fontSize: 12),
//                                             textAlign: TextAlign.center,)),
//                                         ],
//                                       ) : ClipRRect(child: Image.file(
//                                         provider.license_image, fit: BoxFit.cover,),
//                                           borderRadius: BorderRadius.circular(8))
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     // idNumberImge = await imageMedthod();
//                                     provider.id_image = await imageMedthod();
//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                       decoration: BoxDecoration(
//                                           color: kHomeColor,
//                                           borderRadius: BorderRadius
//                                               .circular(8)),
//                                       height: height * 0.12,
//                                       width: width * 0.35,
//                                       child: provider.id_image == null ? Column(
//                                         crossAxisAlignment: CrossAxisAlignment
//                                             .center,
//                                         children: [
//                                           SizedBox(height: height * 0.03,),
//                                           Icon(Icons.camera_alt_outlined,
//                                             color: kTextColor,),
//                                           Text(LocaleKeys.idNumber.tr(),
//                                             style: TextStyle(
//                                                 fontFamily: "dinnextl regular",
//                                                 color: kTextColor,
//                                                 fontSize: 12),
//                                             textAlign: TextAlign.center,),
//                                         ],
//                                       ) : ClipRRect(child: Image.file(
//                                         provider.id_image, fit: BoxFit.cover,),
//                                           borderRadius: BorderRadius.circular(8))
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: height * 0.02,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () async {
//                                     // frontCameraImage = await imageMedthod();
//                                     provider.frontCameraImage = await imageMedthod();
//                                     setState(() {});
//                                   },
//
//                                   child: Container(
//                                       decoration: BoxDecoration(
//                                           color: kHomeColor,
//                                           borderRadius: BorderRadius
//                                               .circular(8)),
//                                       height: height * 0.12,
//                                       width: width * 0.35,
//                                       child: provider.frontCameraImage == null ? Column(
//                                         crossAxisAlignment: CrossAxisAlignment
//                                             .center,
//                                         children: [
//                                           SizedBox(height: height * 0.03,),
//                                           Icon(Icons.camera_alt_outlined,
//                                             color: kTextColor,),
//                                           Text(LocaleKeys.imageCarFront.tr(),
//                                             style: TextStyle(
//                                                 fontFamily: "dinnextl regular",
//                                                 color: kTextColor,
//                                                 fontSize: 12),
//                                             textAlign: TextAlign.center,),
//                                         ],
//                                       ) : ClipRRect(child: Image.file(
//                                         provider.frontCameraImage, fit: BoxFit.cover,),
//                                           borderRadius: BorderRadius.circular(8))
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     // backCameraImage = await imageMedthod();
//                                     provider.backCameraImage = await imageMedthod();
//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                       decoration: BoxDecoration(
//                                           color: kHomeColor,
//                                           borderRadius: BorderRadius
//                                               .circular(8)),
//                                       height: height * 0.12,
//                                       width: width * 0.35,
//                                       child: provider.backCameraImage == null ? Column(
//                                         crossAxisAlignment: CrossAxisAlignment
//                                             .center,
//                                         children: [
//                                           SizedBox(height: height * 0.03,),
//                                           Icon(Icons.camera_alt_outlined,
//                                             color: kTextColor,),
//                                           Text(LocaleKeys.imageCarBack.tr(),
//                                             style: TextStyle(
//                                                 fontFamily: "dinnextl regular",
//                                                 color: kTextColor,
//                                                 fontSize: 12),
//                                             textAlign: TextAlign.center,),
//                                         ],
//                                       ) : ClipRRect(child: Image.file(
//                                         provider.backCameraImage, fit: BoxFit.cover,),
//                                           borderRadius: BorderRadius.circular(8))
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: height * 0.04,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(LocaleKeys.imageOfInsur.tr(),
//                                   style: TextStyle(
//                                       fontFamily: "dinnextl bold", fontSize: 14),
//                                   textAlign: TextAlign.center,),
//                                 SizedBox(width: width * 0.1,),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     provider.insurance_image = await imageMedthod();
//                                     setState(() {});
//                                   },
//                                   child: Container(
//                                       decoration: BoxDecoration(color: Colors.white,
//                                           borderRadius: BorderRadius.circular(8)),
//                                       height: height * 0.06,
//                                       width: width * 0.15,
//
//                                       child: Container(
//                                         child: provider.insurance_image == null ?
//                                         Icon(
//                                           Icons.camera_alt_outlined,
//                                           color: kTextColor,)
//                                             : ClipRRect(child: Image.file(
//                                           provider.insurance_image, fit: BoxFit.fitWidth,),
//                                           borderRadius: BorderRadius.circular(
//                                               8),),)),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: height * 0.04,),
//
//                             CustomButton(
//                                 isLoading: isLoading,
//                                 onPressed: () {
//                                   if(_formKey.currentState.validate()&&
//                                       provider.id_image!=null
//                                       &&provider.frontCameraImage!=null
//                                       &&provider.license_image!=null
//                                   &&provider.insurance_image!=null
//                                   &&provider.backCameraImage!=null
//                                   &&provider.prof_image!=null){
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                     CompleteDataController().CompleteData(context).then((value) {
//                                       setState(() {
//                                         isLoading = false;
//                                       });
//                                     });
//                                   }else{
//                                     Fluttertoast.showToast(
//                                         msg: "${LocaleKeys.completeFields.tr()}",
//                                         toastLength: Toast.LENGTH_LONG,
//                                         gravity: ToastGravity.BOTTOM,
//                                         timeInSecForIosWeb: 1,
//                                         backgroundColor: kPrimaryColor,
//                                         textColor: Colors.white,
//                                         fontSize: 16.0
//                                     );
//                                   }
//
//                             }, title: LocaleKeys.confirm.tr()),
//                             SizedBox(height: height * 0.04,),
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//               );
//
//           }
//           return null;
//         }
//     );
  }
}
