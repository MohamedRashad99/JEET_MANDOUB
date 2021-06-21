import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/setttings/Data/conditionModel.dart';
import 'package:jeet/screens/setttings/Data/controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  ConditionModel _conditionModel = ConditionModel();
CondtionGetData _condtionGetData=CondtionGetData();


  bool loading = true;
  void _getData()async{
    _conditionModel=await _condtionGetData.getConditionData();
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    _getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;



    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(backgroundColor: kPrimaryColor,title: Text(LocaleKeys.conditions.tr()),),
      body:  loading ? SpinKitChasingDots(
      size: 20,
      color: kPrimaryColor,
    )
        : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            height: height*0.1,
            width: width*0.9,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: kHomeColor ),
            child: Center(child: Text(_conditionModel.data[0].value.toString(),style: TextStyle(fontFamily: "dinnextl medium",fontSize: 16,color: kTextColor))),


          ),
        ],
      ),
    );
  }
}
