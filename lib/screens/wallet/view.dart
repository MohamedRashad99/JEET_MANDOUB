import 'package:flutter/material.dart';
import 'package:jeet/screens/walletReports/wall/page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/constants.dart';

import 'package:jeet/screens/collectableMoney/Data/collectModel.dart';
import 'package:jeet/screens/collectableMoney/Data/controller.dart';
import 'package:jeet/screens/collectableMoney/view.dart';
import 'package:jeet/screens/topUpCredit/view.dart';
import 'package:jeet/screens/wallet/Data/balanceController.dart';
import 'package:jeet/screens/wallet/Data/deliveryBalanceModel.dart';
import 'package:jeet/widgets/smallButton.dart';
import 'package:jeet/screens/walletReport/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import'dart:io';



class Wallet extends StatefulWidget {

  final int amount;
  final String name;
  final String bank;
  final int iban;
  final int deliveryID;
  final File image;

  Wallet({ this.amount, this.name, this.bank, this.iban,this.deliveryID, this.image});
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  collectMoneyModel _moneyModel = collectMoneyModel();
  CollectController _collectController =CollectController();

  deliveryBalanceModel _deliveryBalanceModel=deliveryBalanceModel();
  deliveryBalanceController _deliveryBalanceController = deliveryBalanceController();
  bool loading = true;
  Future _getData ()async{
    _deliveryBalanceModel  = await _deliveryBalanceController.getDeliveryBalancerData();
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
      appBar: AppBar(backgroundColor: kPrimaryColor,title: Text(LocaleKeys.wallet.tr(),style: TextStyle(fontFamily: "dinnextl bold", fontSize: 18,)),),
      body: loading ? SpinKitChasingDots(
        size: 40,
        color: kPrimaryColor,
      ):Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            SizedBox(height: height*0.05,),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(LocaleKeys.rs.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 20),),
            ),
            //_deliveryBalanceModel.data.balance
            Text(
             _deliveryBalanceModel.data==null? "0.0":_deliveryBalanceModel.data.balance,
              style: TextStyle(fontFamily: "dinnextl bold",fontSize: 40),),
            Text(LocaleKeys.currentBalance.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 15,color: kTextColor),),
            SizedBox(height: height*0.15,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopUpCredit(image: widget.image ,deliveryID:widget.deliveryID,)),
                );
              },title: LocaleKeys.topUp.tr(),color: kPrimaryColor,),
              SmallButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CollectableMoney()),
                  );
              },title: LocaleKeys.collectMoney.tr(),),
            ],
          ),
            SizedBox(height: height*0.25,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WalletReportsPage()),
                );
              },
              child: Container(
                height: height*0.1,
                width: width*0.8,
                decoration: BoxDecoration(color:kHomeColor,borderRadius:BorderRadius.circular(8) ),
                child:Row(
                  children: [
                    SizedBox(width:width*0.06, ),
                    Icon(Icons.account_balance_wallet_outlined),
                    SizedBox(width:width*0.04, ),
                    Text(
                      LocaleKeys.walletReport.tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'dinnextl medium'),
                    ),
                    SizedBox(width:width*0.3, ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
