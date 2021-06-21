import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/home/Provider/activationKiloMeter.dart';
import 'package:provider/provider.dart';

import 'package:jeet/screens/home/Data/profileControl.dart';
import 'package:jeet/screens/home/Data/profileModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



import '../../constants.dart';

class Titles extends StatefulWidget {
  @override
  _TitlesState createState() => _TitlesState();
}

class _TitlesState extends State<Titles> {
  bool val = false;



  ProfileModel _profileModel =ProfileModel();
  ProfileGetData _profileGetData =ProfileGetData();

  bool loading = true;
  Future _getProData() async {
    _profileModel =await  _profileGetData.getProfileData();
    setState(() {
      loading = false;
    });
  }

  void initState() {
    _getProData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var activeButtom = Provider.of<ActivationKiloMeter>(context,);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return loading ? SpinKitChasingDots(
      size: 20,
      color: kPrimaryColor,
    ):
    Container(
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.welcome.tr(),
                style: TextStyle(color: Colors.black,fontFamily: 'dinnextl bold'),
              ),
              SizedBox(
                width: 5,
              ),
              //  _profileModel.data.name.toString(),
              Text(
                _profileModel.data.delivery.name.toString(),
                style: TextStyle(
                    color: Colors.red,fontFamily: 'dinnextl bold'),
              ),
            ],
          ),
          Text(
            LocaleKeys.anotherDay.tr(),
            style: TextStyle(color: Colors.grey,fontFamily: 'dinnextl medium'),
          ),
          SizedBox(
            height: height*0.04,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.activation.tr()+'\t\t',
                style: TextStyle(fontFamily: 'dinnextl bold'),
              ),
              FlutterSwitch(
                height: height*0.05,
                width: width*0.2,
                activeColor: kPrimaryColor,
                value: val,
                onToggle: (newValue) {
                  setState(() {
                    val = newValue;
                    if(val == false){
                      activeButtom.activate= 0;
                    }else{
                      activeButtom.activate= 1;
                    }
                    print(activeButtom.activate);
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: height*0.04,
          ),
          Center(
            child: Text(
              LocaleKeys.choose.tr(),
              style: TextStyle(color: Colors.grey,fontFamily: 'dinnextl bold'),
            ),
          ),
          SizedBox(
            height: height*0.04,
          ),
        ],
      ),
    );
  }
}
