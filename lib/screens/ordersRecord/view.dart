// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:jeet/constants.dart';
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:jeet/screens/Parcels/view.dart';
// import 'package:jeet/screens/orders_record/pages/Bounced/Data/BouncedController.dart';
// import 'package:jeet/screens/orders_record/pages/Bounced/Data/BouncedModel.dart';
// import 'package:jeet/screens/orders_record/pages/Done/doneController.dart';
// import 'package:jeet/screens/orders_record/pages/Done/doneModel.dart';
// import 'package:jeet/screens/orders_record/pages/Payment/paymentController.dart';
// import 'package:jeet/screens/orders_record/pages/Payment/paymentModel.dart';
// import 'package:jeet/screens/orders_record/pages/Uderway/Data/underwayRecordOrderController.dart';
// import 'package:jeet/screens/orders_record/pages/Uderway/Data/underwayRecordOrderModel.dart';
//
// import 'package:jeet/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// class OrdersRecord extends StatefulWidget {
//   @override
//   _OrdersRecordState createState() => _OrdersRecordState();
// }
//
// class _OrdersRecordState extends State<OrdersRecord>
//     with SingleTickerProviderStateMixin {
//   String _valueChanged1;
//
//   String _valueChanged2;
//
//   bool fromTo = false;
//   bool search = false;
//   bool inSearch = false;
//
//   //***************   UnderWay Model  & Controller ********************
//   UnderWayModel _wayModel = UnderWayModel();
//   OrdersController _underwayController = OrdersController();
//
//   bool loadingW = true;
//
//   void _getData() async {
//     _wayModel = await _underwayController.getOrders();
//     setState(() {
//       loadingW = false;
//     });
//   }
//
//   //***************   Done Call Model & Controller ********************
//   DoneModel _doneModel = DoneModel();
//   DoneController _doneController = DoneController();
//   bool loadingD = true;
//
//   void _getDoneData() async {
//     _doneModel = await _doneController.getDone();
//     setState(() {
//       loadingD = false;
//     });
//   }
//
//   //********************* Bounced Call Model & Controller****************************
//
//   BouncedModel _bouncedModel = BouncedModel();
//   BouncedController _bouncedController = BouncedController();
//   bool loadingB = true;
//
//   void _getBouncedData() async {
//     _bouncedModel = await _bouncedController.getBounced();
//     setState(() {
//       loadingB = false;
//     });
//   }
//
//   //********************* Payment Call Model & Controller****************************
//
//   PaymentModel _paymentModel = PaymentModel();
//   PaymentController _paymentController = PaymentController();
//   bool loadingP = true;
//
//   void _getPaymentData() async {
//     _paymentModel = await _paymentController.getPayment();
//     setState(() {
//       loadingP = false;
//     });
//   }
//
//   TabController _tabController;
//
//   @override
//   void initState() {
//     _getData();
//     _getDoneData();
//     _getBouncedData();
//     _getPaymentData();
//     _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: kBackgroundColor,
//         appBar: AppBar(
//           backgroundColor: kPrimaryColor,
//           title: Text(
//             LocaleKeys.orderRecord.tr(),
//             style: TextStyle(fontSize: 20, fontFamily: 'dinnextl bold'),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8), color: kHomeColor),
//               margin: EdgeInsets.symmetric(vertical: 15),
//               height: height * 0.07,
//               width: width * 0.9,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Icon(
//                     Icons.search_sharp,
//                     color: Colors.grey,
//                   ),
//                   Text(
//                     LocaleKeys.search.tr(),
//                     style: TextStyle(
//                         color: kTextColor, fontFamily: 'dinnextl medium'),
//                   ),
//                   DropdownButton(
//                       dropdownColor: Colors.white,
//                       value: null,
//                       underline: Container(),
//                       items: [
//                         DropdownMenuItem(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 50),
//                             child: Text(
//                               LocaleKeys.day.tr(),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                   color: kPrimaryColor),
//                             ),
//                           ),
//                           value: 0,
//                           onTap: () {
//                             setState(() {
//                               /* _getBy();
//                                     fromTo=false;*/
//                             });
//                           },
//                         ),
//                         DropdownMenuItem(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 50),
//                             child: Text(
//                               LocaleKeys.month.tr(),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                   color: kPrimaryColor),
//                             ),
//                           ),
//                           value: 1,
//                           onTap: () {
//                             setState(() {
//                               /*_getByM();
//                                     fromTo=false;*/
//                             });
//                           },
//                         ),
//                         DropdownMenuItem(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 50),
//                             child: Text(
//                               LocaleKeys.year.tr(),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                   color: kPrimaryColor),
//                             ),
//                           ),
//                           value: 2,
//                           onTap: () {
//                             setState(() {
//                               /*_getByY();
//                                     fromTo=false;*/
//                             });
//                           },
//                         ),
//                         DropdownMenuItem(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 50),
//                             child: Text(
//                               "${LocaleKeys.from.tr()} ${LocaleKeys.to.tr()}",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                   color: kPrimaryColor),
//                             ),
//                           ),
//                           value: 2,
//                           onTap: () {
//                             setState(() {
//                               fromTo = true;
//                             });
//                           },
//                         ),
//                       ],
//                       onTap: () {},
//                       onChanged: (value) {}),
//                 ],
//               ),
//             ),
//             fromTo == false
//                 ? SizedBox()
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Builder(
//                         builder: (context) => GestureDetector(
//                             // onTap: (){
//                             //   if(_valueChanged1==null&&_valueChanged2==null){
//                             //     Scaffold.of(context).showSnackBar(SnackBar(
//                             //         backgroundColor: kPrimaryColor,
//                             //         content: Text(
//                             //           LocaleKeys.dateOf,
//                             //           style: TextStyle(
//                             //               color: Colors.white,
//                             //               fontWeight: FontWeight.bold,
//                             //               fontSize: 14),
//                             //         )));
//                             //
//                             //   }else{
//                             //     setState(() {
//                             //      // inSearch= true;
//                             //     });
//                             //    // _search();
//                             //   }
//                             // },
//                             child: CircleAvatar(
//                                 maxRadius: 25,
//                                 child: Icon(
//                                   Icons.search,
//                                   size: 30,
//                                 ))),
//                       ),
//                       Container(
//                         width: height * .18,
//                         padding: EdgeInsets.symmetric(vertical: 5),
//                         child: DateTimePicker(
//                           type: DateTimePickerType.date,
//                           dateMask: 'yyyy-MM-dd',
//                           cursorColor: kPrimaryColor,
//                           firstDate: DateTime.utc(2020),
//                           lastDate: DateTime.utc(2200),
//                           textAlign: TextAlign.right,
//                           decoration: InputDecoration(
//                             hintText: LocaleKeys.dateOf.tr(),
//                             suffixIcon: Icon(Icons.date_range),
//                             hintStyle: TextStyle(
//                                 fontSize: 14,
//                                 color: kTextColor,
//                                 fontFamily: "dinnextl medium"),
//                             filled: true,
//                             focusColor: Colors.white,
//                             fillColor: Colors.white,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: kTextColor, width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: kPrimaryColor, width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           use24HourFormat: false,
//                           onChanged: (val) {
//                             // _valueChanged1 = val.toString();
//                             setState(() {});
//                             // print( _valueChanged1);
//                           },
//                           validator: (val) {
//                             if (val.isEmpty) {
//                               return "يرجى ادخال التاريخ";
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                       Container(
//                         width: height * .18,
//                         padding: EdgeInsets.symmetric(vertical: 5),
//                         child: DateTimePicker(
//                           type: DateTimePickerType.date,
//                           dateMask: 'yyyy-MM-dd',
//                           cursorColor: kPrimaryColor,
//                           firstDate: DateTime.utc(2020),
//                           lastDate: DateTime.utc(2200),
//                           textAlign: TextAlign.right,
//                           decoration: InputDecoration(
//                             hintText: LocaleKeys.dateOf.tr(),
//                             suffixIcon: Icon(Icons.date_range),
//                             hintStyle: TextStyle(
//                                 fontSize: 14,
//                                 color: kTextColor,
//                                 fontFamily: "dinnextl medium"),
//                             filled: true,
//                             focusColor: Colors.white,
//                             fillColor: Colors.white,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: kTextColor, width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: kPrimaryColor, width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           use24HourFormat: false,
//                           onChanged: (val) {
//                             _valueChanged2 = val.toString();
//                             setState(() {});
//                             print(_valueChanged2);
//                           },
//                           validator: (val) {
//                             if (val.isEmpty) {
//                               return "يرجى ادخال التاريخ";
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//             Container(
//               height: height * 0.14,
//               margin: EdgeInsets.only(top: 28),
//               child: TabBar(
//                 controller: _tabController,
//                 indicatorColor: kPrimaryColor,
//                 indicatorSize: TabBarIndicatorSize.tab,
//                 indicatorWeight: 3,
//                 unselectedLabelColor: Colors.black,
//                 labelColor: kPrimaryColor,
//                 isScrollable: true,
//                 tabs: [
//                   Column(
//                     children: [
//                       SizedBox(
//                           child: Image.asset(
//                             'assets/images/onWay.png',
//                           ),
//                           height: height * 0.065,
//                           width: width * 0.25),
//                       SizedBox(
//                         height: height * 0.025,
//                       ),
//                       Text(
//                         LocaleKeys.underWay.tr(),
//                         style: TextStyle(
//                             fontSize: 14,
//                             // color: Colors.black,
//                             fontFamily: 'dinnextl medium'),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                           child: Image.asset('assets/images/done.png'),
//                           height: height * 0.065,
//                           width: width * 0.25),
//                       SizedBox(
//                         height: height * 0.025,
//                       ),
//                       Text(
//                         LocaleKeys.done.tr(),
//                         style: TextStyle(
//                             fontSize: 14,
//                             //color: Colors.black,
//                             fontFamily: 'dinnextl medium'),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                           child: Image.asset('assets/images/bk.png'),
//                           height: height * 0.062,
//                           width: width * 0.25),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Text(
//                         LocaleKeys.bounced.tr(),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: "dinnextl medium",
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                           child: Image.asset('assets/images/onR.png'),
//                           height: height * 0.060,
//                           width: width * 0.18),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Text(
//                         LocaleKeys.paymentRequest.tr(),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: "dinnextl medium",
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                       SizedBox(
//                         width: width * 0.1,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(controller: _tabController, children: [
//                 //***************************  Underway(),  **********************************************,
//                 loadingW
//                     ? SpinKitChasingDots(
//                         size: 20,
//                         color: kPrimaryColor,
//                       )
//                     : Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: ListView.builder(
//                           itemCount: _wayModel.data.length,
//                           itemBuilder: (_, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ParclesPackages(
//                                           orderID: _wayModel.data[index].id,
//                                         )),
//                               );
//                             },
//                             child: Container(
//                               height: height * .26,
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.dateOf.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _wayModel.data[index].acceptedDate
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.orderNumber.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _wayModel.data[index].code.toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.captainName.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _wayModel.data[index].dealerName
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                 //***************************  Done(),  **********************************************,
//                 loadingD
//                     ? SpinKitChasingDots(
//                         size: 20,
//                         color: kPrimaryColor,
//                       )
//                     : Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: ListView.builder(
//                           itemCount: _doneModel.data.length,
//                           itemBuilder: (_, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ParclesPackages(
//                                           orderID: _doneModel.data[index].id,
//                                         )),
//                               );
//                             },
//                             child: Container(
//                               height: height * .26,
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.dateOf.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _doneModel.data[index].acceptedDate
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.orderNumber.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _doneModel.data[index].code
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.captainName.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _doneModel.data[index].dealerName
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                 /* Done( ),*/
//                 //********************************  Bounced(),  ******************************************,
//                 loadingB
//                     ? SpinKitChasingDots(
//                         size: 20,
//                         color: kPrimaryColor,
//                       )
//                     : Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: ListView.builder(
//                           itemCount: _bouncedModel.data.length,
//                           itemBuilder: (_, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ParclesPackages(
//                                           orderID: _bouncedModel.data[index].id,
//                                         )),
//                               );
//                             },
//                             child: Container(
//                               height: height * .26,
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.dateOf.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _bouncedModel.data[index].acceptedDate
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.orderNumber.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _bouncedModel.data[index].code
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.captainName.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _bouncedModel.data[index].dealerName
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                 //********************************  Payment(),  ******************************************,
//                 loadingP
//                     ? SpinKitChasingDots(
//                         size: 20,
//                         color: kPrimaryColor,
//                       )
//                     : Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: ListView.builder(
//                           itemCount: _paymentModel.data.length,
//                           itemBuilder: (_, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ParclesPackages(
//                                           orderID: _paymentModel.data[index].id,
//                                         )),
//                               );
//                             },
//                             child: Container(
//                               height: height * .26,
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.dateOf.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _paymentModel.data[index].acceptedDate
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.orderNumber.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _paymentModel.data[index].code
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Divider(
//                                     height: 2,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           LocaleKeys.captainName.tr(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 15),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           _paymentModel.data[index].dealerName
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'dinnextl medium',
//                                               fontSize: 13,
//                                               color: kTextColor),
//                                           textAlign: TextAlign.start,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                 // Done(),
//                 // Bounced(),
//                 // Payment(),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _Tap extends StatelessWidget {
//   final String img;
//   final String title;
//   final double width;
//   final double height;
//
//   const _Tap({Key key, this.img, this.title, this.width, this.height})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//             child: Image.asset(
//               '$img',
//             ),
//             height: height * 0.065,
//             width: width * 0.25),
//         SizedBox(
//           height: height * 0.025,
//         ),
//         Text(
//           "$title",
//           style: TextStyle(
//               fontSize: 14,
//               // color: Colors.black,
//               fontFamily: 'dinnextl medium'),
//         ),
//       ],
//     );
//   }
// }
