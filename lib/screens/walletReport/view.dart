import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:jeet/screens/walletReport/All/all.dart';
import 'package:jeet/screens/walletReport/Charge/charge.dart';
import 'package:jeet/screens/walletReport/Payments/payments.dart';
import 'package:jeet/screens/walletReport/withdraw/withdraw.dart';


class WalletReport extends StatefulWidget {
  @override
  _WalletReportState createState() => _WalletReportState();
}

class _WalletReportState extends State<WalletReport> with SingleTickerProviderStateMixin  {


  String _valueChanged1 ;
  String _valueChanged2 ;
  bool fromTo = false;
  bool search = false;
  bool inSearch = false;


  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            LocaleKeys.walletReport.tr(),
            style: TextStyle(fontSize: 20, fontFamily: 'dinnextl bold'),
          ),
        ),
        body: Column(
          children: [

            Container(
              height: height*.073,
              margin: EdgeInsets.symmetric(vertical: 30,horizontal:30),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:Border.all(color: kRoundColor,width:1) ,
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.money_outlined,color: kTextColor,),
                  Text(LocaleKeys.wallet.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                  DropdownButton(
                      dropdownColor: Colors.white,
                      value: null,
                      underline: Container(),
                      items: [
                        DropdownMenuItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(LocaleKeys.day.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                          ),
                          value:0,
                          onTap: (){
                            setState(() {
                            //  _getBy();
                              fromTo=false;
                            });
                          },
                        ),
                        DropdownMenuItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(LocaleKeys.month.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                          ),
                          value: 1,
                          onTap: (){
                            setState(() {
                              //_getByM();
                              fromTo=false;
                            });
                          },
                        ),
                        DropdownMenuItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(LocaleKeys.year.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                          ),
                          value: 2,
                          onTap: (){
                            setState(() {
                             // _getByY();
                              fromTo=false;
                            });
                          },
                        ),
                        DropdownMenuItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text("${LocaleKeys.from.tr()} ${LocaleKeys.to.tr()}",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                          ),
                          value: 2,
                          onTap: (){
                            setState(() {
                              fromTo=true;
                            });
                          },
                        ),
                      ],
                      onTap: (){
                      },
                      onChanged: (value) {
                      }),
                ],
              ),
            ),
            fromTo==false?SizedBox():Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
              children: [
                Builder(
                  builder: (context)=>
                      GestureDetector(
                          onTap: (){
                            if(_valueChanged1==null&&_valueChanged2==null){
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  backgroundColor: kPrimaryColor,
                                  content: Text(
                                    LocaleKeys.dateOf,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )));

                            }else{
                             // _search();
                            }
                          },
                          child: CircleAvatar(maxRadius:25,child: Icon(Icons.search,size: 30,))),
                ),
                Container(
                  width: height*.18,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'yyyy-MM-dd',
                    cursorColor: kPrimaryColor,
                    firstDate: DateTime.utc(2020),
                    lastDate: DateTime.utc(2200),
                    textAlign: TextAlign.right,
                    decoration:InputDecoration(
                      hintText:LocaleKeys.startTime.tr() ,
                      suffixIcon: Icon(Icons.date_range),
                      hintStyle: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium"),
                      filled: true,
                      focusColor: Colors.white,
                      fillColor:Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:kTextColor,width:1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor,width:1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    use24HourFormat: false,
                    onChanged: (val) {
                      _valueChanged1 = val.toString();
                      setState(() {

                      });
                      print( _valueChanged1);
                    },
                    validator: (val) {
                      if(val.isEmpty){
                        return "يرجى ادخال التاريخ";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  width: height*.18,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'yyyy-MM-dd',
                    cursorColor: kPrimaryColor,
                    firstDate: DateTime.utc(2020),
                    lastDate: DateTime.utc(2200),
                    textAlign: TextAlign.right,
                    decoration:InputDecoration(
                      hintText: LocaleKeys.endTime.tr(),
                      suffixIcon: Icon(Icons.date_range),
                      hintStyle: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium"),
                      filled: true,
                      focusColor: Colors.white,
                      fillColor:Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:kTextColor,width:1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor,width:1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    use24HourFormat: false,
                    onChanged: (val) {
                      _valueChanged2 = val.toString();
                      setState(() {

                      });
                      print( _valueChanged2);
                    },
                    validator: (val) {
                      if(val.isEmpty){
                        return "يرجى ادخال التاريخ";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: height*0.02,),


            TabBar(
              controller: _tabController,
              indicatorColor: kPrimaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              unselectedLabelColor: Colors.black,
              labelColor: kPrimaryColor,
              isScrollable: true,
              tabs: [
                Text(
                  LocaleKeys.all.tr(),
                  style: TextStyle(
                      fontSize: 16,
                      // color: Colors.black,
                      fontFamily: 'dinnextl medium'),
                ),
                Text(
                  LocaleKeys.charge.tr(),
                  style: TextStyle(
                      fontSize: 16,
                      //color: Colors.black,
                      fontFamily: 'dinnextl medium'),
                ),

                Text(
                  LocaleKeys.withdraw.tr(),
                  style: TextStyle(
                      fontSize:16,
                      fontFamily: 'dinnextl medium'),
                ),
              ],
            ),
            SizedBox(height: height*0.04,),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                All(),
                Charge(),
                Withdraw(),
              ]),
            )
          ],
        ),
      ),
    );
  }
  }

