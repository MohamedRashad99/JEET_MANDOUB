// import 'package:flutter/material.dart';
// import 'package:jeeet_mandob/generated/locale_keys.g.dart';
// import 'package:jeeet_mandob/screens/new_orders/Data/controller.dart';
// import 'package:jeeet_mandob/screens/new_orders/Data/newOrdersModel.dart';
// import 'package:jeeet_mandob/screens/parcelsDistances/home_parcels_distances.dart';
// import 'package:jeeet_mandob/widgets/smallButton.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// import '../../constants.dart';
//
// class NewOrderCard extends StatefulWidget {
//   @override
//   _NewOrderCardState createState() => _NewOrderCardState();
// }
//
// class _NewOrderCardState extends State<NewOrderCard> {
//
//   NewOrderModel newOrderModel=NewOrderModel();
//   NewOrderController _newOrderController=NewOrderController();
//   bool loading = true;
//
//   Future _getData ()async{
//     newOrderModel  = await _newOrderController.getNewOrderData();
//     setState(() {
//       loading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     _getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomeParecelsAndDistances()),
//         );
//       },
//       child: Padding(
//         padding:  EdgeInsets.only(top:15),
//         child: Container(
//           height: height*.33,
//           padding: EdgeInsets.symmetric(horizontal:20),
//           margin: EdgeInsets.symmetric(horizontal:20,vertical:2),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10)
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //"Trader Name"
//               Text(newOrderModel.data[2].dealerName,
//                   style: TextStyle(
//                     fontFamily: 'dinnextl medium',
//                     color: Colors.black,
//                   )),
//               Text('Faisal Mohammed',
//                   style: TextStyle(
//                       fontFamily: 'dinnextl medium',
//                       color: kTextColor)),
//               Divider(height: 2,),
//
//               Text(LocaleKeys.totalPrice.tr(),
//                   style: TextStyle(
//                     fontFamily: 'dinnextl medium',
//                     color: Colors.black,
//                   )),
//               Text("142\t"'${  LocaleKeys.rs.tr()}',
//                   style: TextStyle(
//                       fontFamily: 'dinnextl medium',
//                       color: kTextColor)),
//               Divider(height: 2,),
//               Text(LocaleKeys.orderNumber.tr(),
//                   style: TextStyle(
//                     fontFamily: 'dinnextl medium',
//                     color: Colors.black,
//                   )),
//               Text('122',
//                   style: TextStyle(
//                       fontFamily: 'dinnextl medium',
//                       color: kTextColor)),
//               Divider(height: 2,),
//               Row(
//                 children: [
//                   SmallButton(onPressed: (){}, title: LocaleKeys.accept.tr(),color: kPrimaryColor,),
//                   SmallButton(onPressed: (){}, title: LocaleKeys.refuse.tr()),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
