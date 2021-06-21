import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/statusOrders/Data/controller.dart';
import 'package:jeet/screens/statusOrders/Data/model.dart';
import 'package:jeet/widgets/smallButton.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class StatusforEveryOrders extends StatefulWidget {
  final int packageId;
  // final int status;
  // final  String reason;


   StatusforEveryOrders({this.packageId, });
   //this.status, this.reason,

  @override
  _StatusforEveryOrdersState createState() => _StatusforEveryOrdersState();
}

class _StatusforEveryOrdersState extends State<StatusforEveryOrders> {
  ParcelsStatusModel _parcelsStatusModel = ParcelsStatusModel();
  ParcelStatusController _parcelStatusController =ParcelStatusController();


  bool _isLoading = true;
  void _getParcelsStatusData() async {
    _parcelsStatusModel = await _parcelStatusController.getParcelsStatusData(
       packageID: widget.packageId,
        // Status: _parcelsStatusModel.data.package.status==2? 2 : _parcelsStatusModel.data.package.status == 4 ? 4:null,
        // Reason: _parcelsStatusModel.data.package.reason ==null ? null :_parcelsStatusModel.data.package.reason.toString(),
    );
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    _getParcelsStatusData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title:Text(
            LocaleKeys.orderStatus.tr(),
            style: TextStyle(
              fontFamily: 'dinnextl bold',
              fontSize: 20,
            ),
          )
      ),
      body:_isLoading ? SpinKitChasingDots(
        size: 20,
        color: kPrimaryColor,
      ): SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height*0.05,),
             buildContainer(height: height*0.11 , width: width*0.9,text1: LocaleKeys.clientName.tr() ,text2: _parcelsStatusModel.data.userName==null?"": _parcelsStatusModel.data.userName ),
            buildContainer(height: height*0.11 , width: width*0.9,text1: LocaleKeys.clientPhone.tr() ,text2:_parcelsStatusModel.data.deliveryPhone.toString() ),
            buildContainer(height: height*0.11 , width: width*0.9,text1: LocaleKeys.paymentMethod.tr() ,text2:_parcelsStatusModel.data.package.paymentType==0?LocaleKeys.payWhenReceived.tr():LocaleKeys.whenRecive.tr() ),
            buildContainer(height: height*0.11 , width: width*0.9,text1: LocaleKeys.price.tr(),text2:_parcelsStatusModel.data.totalPrice.toString()),
            buildContainer(height: height*0.11 , width: width*0.9,text1: LocaleKeys.deliveryPrice.tr() ,text2:_parcelsStatusModel.data.package.deliveryPrice.toString(),),
            buildContainer(height: height*0.11 , width: width*0.9,text1: LocaleKeys.parcelValue.tr() ,text2:_parcelsStatusModel.data.code.toString(),),
            buildContainer(height: height*0.11 , width: width*0.9,text1:LocaleKeys.status.tr() ,
                text2:(_parcelsStatusModel.data.package.status==0)?LocaleKeys.underWay.tr():
                (_parcelsStatusModel.data.package.status==1)? LocaleKeys.withDel.tr():
                (_parcelsStatusModel.data.package.status==2)? LocaleKeys.done.tr():
                (_parcelsStatusModel.data.package.status==3)? LocaleKeys.orderCanceled.tr():
                (_parcelsStatusModel.data.package.status==4)? LocaleKeys.bounce.tr():""),
            SizedBox(height: height*0.03,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallButton(onPressed: ()async {
                  await _parcelStatusController.getParcelsStatusData(
                    packageID: widget.packageId,
                    // Status: 2,
                    // Reason: _parcelsStatusModel.data.package.reason ==null ? null :_parcelsStatusModel.data.package.reason,
                  );
                }, title: LocaleKeys.done.tr(),color: kPrimaryColor,),
                SmallButton(onPressed: ()async{
                  await _parcelStatusController.getParcelsStatusData(
                    packageID: widget.packageId,
                    // Status: 4,
                    // Reason: _parcelsStatusModel.data.package.reason ==null ? null :_parcelsStatusModel.data.package.reason,
                  );
                }, title: LocaleKeys.bounce.tr(),),
              ],
            ),

            Padding(
              padding:  EdgeInsets.only(top: 40,left: 25,bottom: 40),
              child: Align(child: CircleAvatar(maxRadius: 25,backgroundColor: kPrimaryColor,child: Image.asset("assets/images/messages.png",),),alignment: Alignment.topLeft,),
            ),

          ],
        ),
      ),
    );
  }
  Widget buildContainer({double height, double width ,text1 , text2  }) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: kTextColor,borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 7,),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          decoration: BoxDecoration(color: kHomeColor,borderRadius: BorderRadius.circular(8)),
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: width*0.6,),

              Text(text1,style: TextStyle(fontFamily: 'dinnextl bold',fontSize: 16,),),
              context.locale == Locale('en', 'US')?
              Align(alignment:Alignment.bottomRight ,child: Text(text2,style: TextStyle(fontFamily: 'dinnextl bold',fontSize: 14,color: kTextColor),softWrap: true ,overflow: TextOverflow.fade,)):
              Align(alignment:Alignment.bottomLeft ,child: Text(text2,style: TextStyle(fontFamily: 'dinnextl bold',fontSize: 14,color: kTextColor),softWrap: true ,overflow: TextOverflow.fade,)),


            ],
          ),
        )
      ],
    );
  }


}
