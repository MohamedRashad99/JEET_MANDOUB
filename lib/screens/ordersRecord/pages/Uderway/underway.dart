// import 'package:flutter/material.dart';
// import 'package:jeeet_mandob/constants.dart';
// import 'package:jeeet_mandob/generated/locale_keys.g.dart';
// import 'package:jeeet_mandob/screens/orders_record/pages/Uderway/Data/underwayRecordOrderController.dart';
// import 'package:jeeet_mandob/screens/status_orders/home_status_orders.dart';
// import 'package:easy_localization/easy_localization.dart';
//
//
// class Underway extends StatefulWidget {
//   @override
//   _UnderwayState createState() => _UnderwayState();
// }
//
// class _UnderwayState extends State<Underway> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     var height= MediaQuery.of(context).size.height;
//     var width= MediaQuery.of(context).size.width;
//     return Padding(
//       padding:  EdgeInsets.symmetric(vertical:10),
//       child: ListView.builder(
//           itemCount: _wayModel.data.length,
//           itemBuilder: (_,index)=> GestureDetector(
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeStatusOrders()),
//               );
//             },
//             child: Container(
//               height: height*.26,
//               margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Align(alignment: Alignment.centerLeft,
//                         child: Text(LocaleKeys.dateOf.tr(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 15),textAlign: TextAlign.start,)),
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Align(alignment: Alignment.centerLeft,
//                         child: Text(_underwayModelRecordOrder.data[index].acceptedDate.toString(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 13,color: kTextColor),textAlign: TextAlign.start,)),
//                   ),
//                   Divider(height: 2,),
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Align(alignment: Alignment.centerLeft,
//                         child: Text(LocaleKeys.orderNumber.tr(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 15),textAlign: TextAlign.start,)),
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Align(alignment: Alignment.centerLeft,
//                         child: Text(_underwayModelRecordOrder.data[index].code.toString(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 13,color: kTextColor),textAlign: TextAlign.start,)),
//                   ),
//                   Divider(height: 2,),
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Align(alignment: Alignment.centerLeft,
//                         child: Text(LocaleKeys.captainName.tr(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 15),textAlign: TextAlign.start,)),
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Align(alignment: Alignment.centerLeft,
//                         child: Text(_underwayModelRecordOrder.data[index].dealerName.toString(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 13,color: kTextColor),textAlign: TextAlign.start,)),
//                   ),
//
//                 ],
//
//               ),
//             ),
//           ),
//       ),
//     );
//
//   }
// }
