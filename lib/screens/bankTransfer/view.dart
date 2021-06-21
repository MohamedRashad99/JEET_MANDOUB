import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/screens/bankTransfer/Data/controller.dart';
import 'package:jeet/screens/bankTransfer/Data/model.dart';
import 'package:jeet/screens/wallet/Data/deliveryBalanceModel.dart';
import 'package:jeet/screens/imagePicker/image_picker.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';

import 'package:jeet/global.dart' as globals;

class BankTransfer extends StatefulWidget {
  final int deliveryID;
  final File image;
  BankTransfer({
    this.deliveryID,
    this.image,
  });
  @override
  _BankTransferState createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  deliveryBalanceModel _deliveryBalanceModel = deliveryBalanceModel();

  TransferBank _transferBank = TransferBank();
  BankController _bankController = BankController();
  final _formKey = GlobalKey<FormState>();
  File image;
  final picker = ImagePicker();
  Future<File> imageMedthod() async {
    File returnImage = await TakeImage.imageFile(context);
    if (returnImage != null) {
      return File(returnImage.path);
    } else {
      print("errooooooooooooooor");
    }
  }

  TextEditingController _senderNameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  bool loading = true;
  Future _getData() async {
    await _bankController.setBankData(
      deliveryID: globals.uid,
      amount: int.parse(_amountController.text),
      senederName: _senderNameController.text,
      image: image,
    );
    setState(() {
      loading = false;
    });
  }

  void initState() {
    // _getData();
    super.initState();
  }

  @override
  void dispose() {
    _senderNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  bool valueFirst = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool rayid = true;
    bool raghy = false;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(LocaleKeys.bankTr.tr()),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.toBank.tr(),
                  style: TextStyle(fontFamily: "dinnextl medium", fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //-----------------------------------------------------------------------------
                rayid == false
                    ? SizedBox()
                    : Container(
                        width: width * 0.8,
                        height: height * 0.12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: kHomeColor),
                        child: Image.asset(
                          "assets/images/raghy.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                raghy == false
                    ? SizedBox()
                    : Container(
                        width: width * 0.8,
                        height: height * 0.12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: kHomeColor),
                        child: Image.asset(
                          "assets/images/raghy.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                //-----------------------------------------------------------------
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kRoundColor, width: 1),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.food_bank_outlined,
                        color: kTextColor,
                      ),
                      Text(
                        LocaleKeys.chooseBank.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kTextColor),
                      ),
                      DropdownButton(
                          dropdownColor: Colors.white,
                          value: null,
                          underline: Container(),
                          items: [
                            DropdownMenuItem(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  LocaleKeys.alriyad.tr(),
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kPrimaryColor),
                                ),
                              ),
                              value: 0,
                              onTap: () {
                                setState(() {
                                  rayid = true;
                                });
                              },
                            ),
                            DropdownMenuItem(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  LocaleKeys.alraghy.tr(),
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kPrimaryColor),
                                ),
                              ),
                              value: 1,
                              onTap: () {
                                setState(() {
                                  raghy = true;
                                });
                              },
                            ),
                          ],
                          onTap: () {},
                          onChanged: (value) {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                  child: CustomTextField(
                    controller: _senderNameController,
                    onsave: (value) => _senderNameController = value,
                    valid: (String value) {
                      if (value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                    type: TextInputType.name,
                    dIcon: Icons.person,
                    hint: LocaleKeys.theSenderName.tr(),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
                  child: CustomTextField(
                    controller: _amountController,
                    valid: (String value) {
                      if (value.isEmpty) {
                        return "Amount is required";
                      }
                      return null;
                    },
                    type: TextInputType.number,
                    dIcon: Icons.food_bank_outlined,
                    hint: LocaleKeys.amount.tr(),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: Text(
                    LocaleKeys.addreceipt.tr(),
                    style: TextStyle(fontSize: 16, fontFamily: "dinnextl bold"),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () async {
                    image = await imageMedthod();
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: image == null
                        ? Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                          )
                        : Container(
                            height: height * 0.1,
                            width: width * 0.9,
                            child: ClipRRect(
                                child: Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8))),
                  ),
                ),

                /*       if (_formKey.currentState.validate()) {
    setState(() {
    _formKey.currentState.save();
    });
    }*/
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                    onPressed: () {
                      print(image.path);
                      _getData();
                    },
                    title: LocaleKeys.send.tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
