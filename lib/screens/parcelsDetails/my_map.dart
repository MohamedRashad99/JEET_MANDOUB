import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeet/generated/locale_keys.g.dart';

import 'package:jeet/screens/newOrders/Data/controller.dart';
import 'package:jeet/screens/newOrders/Data/newOrdersModel.dart';
import 'package:jeet/screens/parcelsDetails/Data/Controller.dart';
import 'package:jeet/screens/parcelsDetails/Data/Model.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';

class ParcelsMap extends StatefulWidget {
  final int  packageID;

   ParcelsMap({this.packageID}) ;

  @override
  _ParcelsMapState createState() => _ParcelsMapState();
}

class _ParcelsMapState extends State<ParcelsMap> {
  ParcelsModel _parcelsModel =ParcelsModel();
  ParcelsController _parcelsController =ParcelsController();

  NewOrderModel newOrderModel=NewOrderModel();
  NewOrderController _newOrderController=NewOrderController();
  var recive_from_lng,recive_from_lat,recive_to_lat,recive_to_lng;
  bool _isLoading = true;
  void _getData() async {
    _parcelsModel = await _parcelsController.getParcelsData(
      packageID: widget.packageID,
    );
    setState(() {
      recive_from_lng = double.tryParse(_parcelsModel.data.reciveFromLng);
      recive_from_lat = double.tryParse(_parcelsModel.data.reciveFromLat);
      recive_to_lat= double.tryParse(_parcelsModel.data.reciveToLat);
      recive_to_lng = double.tryParse(_parcelsModel.data.reciveToLng);
      _isLoading = false;
    });
  }
  @override
  void initState() {
    _getData();
    super.initState();
  }


  final GlobalKey scaffoldKey = GlobalKey();

  Completer _controller = Completer();
  Map<MarkerId, Marker> markers = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.045180235165866,31.39164626598358),
    zoom: 14.0,
  );
  List listMarkerIds = List();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
            LocaleKeys.parcels.tr(),
          style: TextStyle(fontFamily: 'dinnextl bold', fontSize: 20),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: _isLoading ? SpinKitChasingDots(
        size: 40,
        color: kPrimaryColor,
      ):SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.6,
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                onTap: (_) {},
                mapType: MapType.normal,
                markers: Set.of(markers.values),
                onMapCreated: (GoogleMapController controler) {
                  _controller.complete(controler);

                  MarkerId markerId1 = MarkerId("1");
                  MarkerId markerId2 = MarkerId("2");

                  listMarkerIds.add(markerId1);
                  listMarkerIds.add(markerId2);

                  Marker marker1 = Marker(
                    markerId: markerId1,
                    position: LatLng(recive_from_lng, recive_from_lat),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueCyan),
                    /* infoWindow: InfoWindow(
                          title: "Hytech City",
                          onTap: () {
                            var bottomSheetController = Scaffold.of(
                                    scaffoldKey.currentContext)
                                .showBottomSheet((context) => Container(
                                      child: getBottomSheet("17.4435, 78.3772"),
                                      height: 250,
                                      color: Colors.transparent,
                                    ));
                          },
                          snippet: "Snipet Hitech City")*/
                  );

                  Marker marker2 = Marker(
                    markerId: markerId2,
                    position: LatLng(recive_to_lat, recive_to_lng),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                  );


                  setState(() {
                    markers[markerId1] = marker1;
                    markers[markerId2] = marker2;

                  });
                },
              ),
            ),
            Column(
              children: [
                SizedBox(height: height*0.1,),
                buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.captainName.tr(),user: _parcelsModel.data.userName ),
                SizedBox(height: height*0.01,),
                buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.orderNumber.tr(),user: _parcelsModel.data.code ),
                SizedBox(height: height*0.01,),
                buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.status.tr(),
                    user: (_parcelsModel.data.status==0)? LocaleKeys.underWay.tr():
                    (_parcelsModel.data.status == 1) ? LocaleKeys.withDel.tr():
                    (_parcelsModel.data.status == 2) ? LocaleKeys.done.tr():
                    (_parcelsModel.data.status == 3) ? LocaleKeys.orderCanceled.tr():
                    (_parcelsModel.data.status == 4) ? LocaleKeys.bounce.tr():""
                ),
                SizedBox(height: height*0.01,),
                buildContainer(heightCon: height*0.08 , widthCon: width*0.85 ,captainName:LocaleKeys.parcelValue.tr(),user: _parcelsModel.data.price.toString() ),
                SizedBox(height: height*0.1,),
                Container(margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Image.asset("assets/images/messages.png",),
                        SizedBox(width: width*0.05,),
                        Text(LocaleKeys.chat.tr(),style: TextStyle(color: kTextColor,fontFamily: "dinnextl medium",fontSize: 16),),
                      ],
                    )),
                SizedBox(height: height*0.1,),

//dateOf
              ],
            ),
           // BuildContainerForButton(),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheet(String s) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 32),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hytech City Public School \n CBSC",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("4.5",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("970 Folowers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Memorial Park",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.map,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$s")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("040-123456")
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
                child: Icon(Icons.navigation), onPressed: () {}),
          ),
        )
      ],
    );
  }
  Container buildContainer({double heightCon, double widthCon , String captainName , String user }) {
    return Container(
      height: heightCon,
      width: widthCon,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kHomeColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(captainName,style: TextStyle(fontFamily: "dinnextl medium"),),
          Text(user,style: TextStyle(fontFamily: "dinnextl medium",color: kTextColor,fontSize: 12),),

        ],),
    );
  }
}
