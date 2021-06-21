import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/screens/personalInfo/view.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:jeet/screens/vehicleSelection/Data/controller.dart';
import 'package:jeet/screens/vehicleSelection/Data/model.dart';
import 'package:provider/provider.dart';

class SelectVehicle extends StatefulWidget {
  @override
  _SelectVehicleState createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {
  SelectCarModel _selectCarModel = SelectCarModel();
  GetCarController _getCarController = GetCarController();
  Future _getVehicles()async{
    _selectCarModel = await _getCarController.GetCars();
  }

@override
  void initState() {
    // TODO: implement initState
    _getVehicles();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var provider = Provider.of<SignUpProvider>(context);
    print(_selectCarModel);
    _getVehicles();
    return FutureBuilder(
      future: _getVehicles(),
        builder: (context ,snapshot){
      switch(snapshot.connectionState){
        case ConnectionState.none:
          print("none");
          return Container(height: MediaQuery.of(context).size.height/1.5,
              child: Center(
                child: SpinKitChasingDots(
                  size: 40,
                  color: kPrimaryColor,
                ),));
        case ConnectionState.active:
        case ConnectionState.waiting:
          return Container(height:height/1.30 ,child: Container(height: MediaQuery.of(context).size.height/1.5,
              child: Center(
                  child: SpinKitChasingDots(
                    size: 40,
                    color: kPrimaryColor,
                  ))));
        case ConnectionState.done:
        return Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text(LocaleKeys.selectVehicle.tr()),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  LocaleKeys.selectVehicleE.tr(),
                  style: TextStyle(fontFamily: "dinnextl bold", fontSize: 18),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(height: height,
                  child: ListView.builder(
                      itemCount: _selectCarModel.data.length,
                      itemBuilder: (context,i){
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://jeeet.net/public/dash/assets/img/${_selectCarModel.data[i].image}",

                                        ),
                                      )),
                                  height: height * 0.1,
                                  width: width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      )),
                                  height: height * 0.1,
                                  width: width * 0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        child: Text(
                                          "${context.locale == Locale('en', 'US')?_selectCarModel.data[i].nameEn
                                              :_selectCarModel.data[i].name}",
                                          style: TextStyle(fontFamily: "dinnextl bold"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          provider.carName = _selectCarModel.data[i].name;
                                          provider.carEnName = _selectCarModel.data[i].nameEn;
                                          provider.carPrice = _selectCarModel.data[i].price;
                                          provider.carId = _selectCarModel.data[i].id;
                                          print(provider.carPrice);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => PersonalInfo()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.pinkAccent.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(8)),
                                          height: height * 0.05,
                                          width: width * 0.25,
                                          child: Text(
                                            "${_selectCarModel.data[i].price} \t "
                                                "${context.locale == Locale('en', 'US')?"SAR":"ريال"}",
                                            style: TextStyle(fontFamily: "dinnextl bold"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                          ],
                        );
                      }),
                ),

              ],
            ),
          ),
        );
      }
      return null;
    }
    );
  }
}
