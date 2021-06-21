// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:jeeet_mandob/screens/parcel_details/Data/Controller.dart';
// import 'package:jeeet_mandob/screens/parcel_details/Data/Model.dart';
// import 'package:jeeet_mandob/screens/parcel_details/my_map.dart';
// import 'package:jeeet_mandob/widgets/customButton.dart';
//
// import 'package:jeeet_mandob/constants.dart';
//
// class OrdersFollow extends StatefulWidget {
//   @override
//   _OrdersFollowState createState() => _OrdersFollowState();
// }
//
// class _OrdersFollowState extends State<OrdersFollow> {
//   ParcelsModel _parcelsModel =ParcelsModel();
//   ParcelsController _parcelsController =ParcelsController();
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         title: Text(
//           'الطلبات الجديدة',
//           style: TextStyle(
//             fontFamily: 'dinnextl bold',
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: LayoutBuilder(
//         builder: (context, _) => Card(
//           margin: EdgeInsets.only(top: 20, left: 15, right: 15),
//           elevation: 7,
//           color: kBackgroundColor,
//           child: Container(
//             margin: EdgeInsets.only(top: 15),
//             height: height * 0.3,
//             width: width,
//             child: Column(
//               children: [
//                 Container(
//                   height: height * 0.15,
//                   width: width,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: height * 0.15,
//                         color: kBackgroundColor,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: width * 0.13,
//                                 ),
//                                 Image.asset(
//                                   'assets/images/flag_icon.png',
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.20,
//                                   child: Stack(
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/arrow_arabic_icon.png',
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 18, top: 19),
//                                         child: Text(
//                                           'Km 6.38',
//                                           style: TextStyle(
//                                             fontFamily: 'dinnextl bold',
//                                             fontSize: 7,
//                                             color: kHomeColor,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Stack(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/location_icon.png',
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.20,
//                                   child: Stack(
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/arrow_arabic_icon.png',
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 18, top: 19),
//                                         child: Text(
//                                           'Km 6.38',
//                                           style: TextStyle(
//                                             fontFamily: 'dinnextl bold',
//                                             fontSize: 7,
//                                             color: kHomeColor,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Stack(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/follow_icon.png',
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 10, top: 8),
//                                   child: Text(
//                                     'موقع التسليم',
//                                     style: TextStyle(
//                                         fontFamily: 'dinnextl bold',
//                                         fontSize: 16),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 10, top: 8),
//                                   child: Text(
//                                     'موقع الاستلام',
//                                     style: TextStyle(
//                                         fontFamily: 'dinnextl bold',
//                                         fontSize: 16),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 45, top: 8),
//                                   child: Text(
//                                     'التتبع',
//                                     style: TextStyle(
//                                         fontFamily: 'dinnextl bold',
//                                         fontSize: 16),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: height * 0.15,
//                   width: width,
//                   color: kHomeColor,
//                   child: Container(
//                     margin: EdgeInsets.only(top: 18, bottom: 18),
//                     child: CustomButton(
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => ParcelsMap(packageID: _parcelsModel.data.id ,)));
//                       },
//                       title: 'تفاصيل الطلب',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
