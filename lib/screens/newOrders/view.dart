import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/newOrders/Data/confirmController.dart';
import 'package:jeet/screens/newOrders/Data/confirmModel.dart';
import 'package:jeet/screens/newOrders/Data/controller.dart';
import 'package:jeet/screens/newOrders/Data/newOrdersModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/screens/parcelsDistances/home_parcels_distances.dart';
import 'package:jeet/widgets/smallButton.dart';
import '../../constants.dart';

class NewOrders extends StatefulWidget {
  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  NewOrderModel newOrderModel = NewOrderModel();
  ConfirmationModel _confirmationModel = ConfirmationModel();

  NewOrderController _newOrderController = NewOrderController();
  ConfirmController _confirmController = ConfirmController();

  bool _hasBeenPressed = false;
  bool loading = true;
  Future _getData() async {
    newOrderModel = await _newOrderController.getNewOrderData();
    setState(() {
      loading = false;
    });
  }
  double _ratingValue;
/*  RateModel _rateModel = RateModel();
  RateController _rateController = RateController();

  bool Rloading = true;
  Future _getRate() async {
    _rateModel = await _rateController.getRateData();
    setState(() {
      Rloading = false;
    });
  }*/
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.newOrder.tr(),
          style: TextStyle(fontFamily: 'dinnextl bold'),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: loading
          ? SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            )
          : ListView.builder(
          itemCount: newOrderModel.data.isEmpty  ? Center(child:Text(LocaleKeys.traderName.tr(),
              style: TextStyle(
                  fontFamily: "dinnextl bold",
                  color: Colors.black,
                  fontSize:14
              ))):  newOrderModel.data.length,
          itemBuilder: (_,index)=> GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParecelsDistances(
                  orderID: newOrderModel.data[index].id,

                )),
              );
            },
            child: Container(
              height: height*.6,
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 2),
              margin: EdgeInsets.symmetric(horizontal:20,vertical:7),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.traderName.tr(),
                      style: TextStyle(
                          fontFamily: "dinnextl bold",
                          color: Colors.black,
                          fontSize:14
                      )),
                  context.locale == Locale('en', 'US')? Text(newOrderModel.data[index].dealerNameEn.toString(),
                      style: TextStyle(
                          fontFamily: 'dinnextl medium',
                          color: kTextColor, fontSize:14)):
                  Text(newOrderModel.data[index].dealerName.toString(),
                      style: TextStyle(
                          fontFamily: 'dinnextl medium',
                          color: kTextColor, fontSize:14)),
                  Divider(),
                  Text(LocaleKeys.totalPrice.tr(),
                      style: TextStyle(
                        fontFamily: "dinnextl bold",
                        color: Colors.black,
                        fontSize:14
                        ,
                      )),
                  Text((newOrderModel.data[index].totalPrice)==null ?LocaleKeys.noRes.tr()+'\t'+LocaleKeys.rs.tr():
                  newOrderModel.data[index].totalPrice.toString()+'\t'+LocaleKeys.rs.tr(),
                      style: TextStyle(
                          fontFamily: 'dinnextl medium',
                          color: kTextColor, fontSize:14)),
                  Divider(),
                  Text(LocaleKeys.orderNumber.tr(),
                      style: TextStyle(
                          fontFamily: "dinnextl bold",
                          color: Colors.black,
                          fontSize:14
                      )),
                  Text(newOrderModel.data[index].code,
                      style: TextStyle(
                          fontFamily: 'dinnextl medium',
                          color: kTextColor, fontSize:14)),
                  Divider(),
                  Text(LocaleKeys.carType.tr(),
                      style: TextStyle(
                          fontFamily: "dinnextl bold",
                          color: Colors.black,
                          fontSize:14
                      )),
                  context.locale == Locale('en', 'US')? Text(newOrderModel.data[index].carNameEn.toString() ,
                      style: TextStyle(
                          fontFamily: 'dinnextl medium',
                          color: kTextColor, fontSize:14)):
                  Text(newOrderModel.data[index].carName.toString(),
                      style: TextStyle(
                          fontFamily: 'dinnextl medium',
                          color: kTextColor)),
                  Divider(),
                  Text(LocaleKeys.totalRate.tr(),
                      style: TextStyle(
                          fontFamily: "dinnextl bold",
                          color: Colors.black,
                          fontSize:14
                      )),
                  RatingBar(
                      initialRating: double.tryParse(newOrderModel.data[index].dealer_rate.toString()),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                          full: SizedBox(
                              height: height*0.05,
                              child: Icon(Icons.star, color: kPrimaryColor,)),
                          empty: SizedBox(
                            height: height*0.05,
                            child: Icon(
                              Icons.star_outline,
                              color: Colors.orange,
                            ),
                          )),
                      onRatingUpdate: (value) {
                        setState(() {
                          _ratingValue = value;
                        });
                      }),

                  Row(
                    children: [
                      SmallButton(
                        onPressed: ( )async{
                          await _confirmController.getConfirmData( newOrderModel.data[index].id, 1 );
                        },title: LocaleKeys.accept.tr(),color: kPrimaryColor,),
                      SmallButton(
                          onPressed: ()async{
                            await _confirmController.getConfirmData( newOrderModel.data[index].id, 0 );
                          },title: LocaleKeys.refuse.tr()),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
