import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/screens/home/Data/bannerModel.dart';
import 'package:jeet/screens/home/Data/controller.dart';
import 'package:jeet/screens/home/titles.dart';
import 'package:jeet/widgets/drawer.dart';
import 'chooseService.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerModel _bannerModel = BannerModel();
  BannersGetData _bannersGetData = BannersGetData();

  bool loading = true;

  Future _getData() async {
    _bannerModel = await _bannersGetData.getBannersData();
    setState(() {
      loading = false;
    });
  }

  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: CustomDrawer(),
      appBar: buildAppBar(width),
      body: SingleChildScrollView(
        child: Column(
          children: [

            loading
                ? SpinKitChasingDots(
                    size: 20,
                    color: kPrimaryColor,
                  )
                : CarouselSlider.builder(
                    itemCount: _bannerModel.data.firstAds.length,
                    options: CarouselOptions(
                      height: height * 0.15,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, _) {
                      return Container(
                        width: height * .54,
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://jeeet.net/public/dash/assets/img/${_bannerModel.data.firstAds[index].image}"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kRoundBorderColor, width: 1)),
                      );
                    },
                  ),

            loading
                ? SpinKitChasingDots(
                    size: 20,
                    color: kPrimaryColor,
                  )
                : CarouselSlider.builder(
                    itemCount: _bannerModel.data.secondAds.length,
                    options: CarouselOptions(
                      height: height * 0.09,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, _) {
                      return Container(
                        width: height * .54,
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://jeeet.net/public/dash/assets/img/${_bannerModel.data.secondAds[index].image}"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kRoundBorderColor, width: 1)),
                      );
                    },
                  ),
            // SmallSlider(),
            Titles(),
            ChooseService(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(double width) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      actions: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              SizedBox(width: width*0.01,),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: width*0.05,),
              Icon(Icons.add_alert),
            ],
          ),
        ),
      ],
    );
  }
}
