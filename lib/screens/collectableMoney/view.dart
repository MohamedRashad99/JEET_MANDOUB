import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';

import 'package:jeet/screens/collectableMoney/Data/controller.dart';
import 'package:jeet/screens/wallet/Data/balanceController.dart';
import 'package:jeet/screens/wallet/Data/deliveryBalanceModel.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';

class CollectableMoney extends StatefulWidget {
  @override
  _CollectableMoneyState createState() => _CollectableMoneyState();
}

class _CollectableMoneyState extends State<CollectableMoney> {
  // collectMoneyModel _moneyModel = collectMoneyModel();
  CollectController _collectController = CollectController();
  final _formKey = GlobalKey<FormState>();

  deliveryBalanceModel _deliveryBalanceModel = deliveryBalanceModel();
  deliveryBalanceController _deliveryBalanceController = deliveryBalanceController();

  TextEditingController _amountController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _ibanController = TextEditingController();

  bool loadingB = true;
  Future _getDataBalance() async {
    _deliveryBalanceModel = await _deliveryBalanceController.getDeliveryBalancerData();
    setState(() {
      loadingB = false;
    });
  }

  bool loading = true;
  Future _getData() async {
    _getDataBalance();
    await _collectController.getMoneyData(
        Amount: _amountController.text, Name: _nameController.text, Bank: _bankController.text, Iban: _ibanController.text);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
    //amount.text='ahmed';
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _bankController.dispose();
    _ibanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.collectMoney.tr()),
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
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                height: height,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        height: height * 0.2,
                        width: width * 0.5,
                        decoration: BoxDecoration(color: kHomeColor, borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(_deliveryBalanceModel.data == null ? "0.0" : _deliveryBalanceModel.data.balance,
                                style: TextStyle(fontFamily: "dinnextl bold", fontSize: 22))),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        hint: LocaleKeys.accountIban.tr(),
                        controller: _ibanController,
                        valid: (String value) {
                          if (value.isEmpty) {
                            return "IBAN is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        hint: LocaleKeys.ncb.tr(),
                        dIcon: Icons.food_bank_outlined,
                        controller: _bankController,
                        valid: (String value) {
                          if (value.isEmpty) {
                            return "Bank Name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        hint: LocaleKeys.clientName.tr(),
                        dIcon: Icons.person,
                        controller: _nameController,
                        valid: (String value) {
                          if (value.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        hint: LocaleKeys.theAmountwithdraw.tr(),
                        dIcon: Icons.wallet_giftcard_outlined,
                        controller: _amountController,
                        valid: (String value) {
                          if (value.isEmpty) {
                            return "Amount is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      CustomButton(onPressed: _getData, title: LocaleKeys.confirm.tr())
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
