import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jeet/screens/setttings/Rates/Data/controller.dart';
import 'package:jeet/screens/setttings/Rates/Data/model.dart';

class Rates extends StatefulWidget {
  @override
  _RatesState createState() => _RatesState();
}

class _RatesState extends State<Rates> {
  RateModel _rateModel = RateModel();
  RateController _rateController = RateController();

  bool loading = true;
  Future _getData() async {
    _rateModel = await _rateController.getRateData();
    setState(() {
      loading = false;
    });
  }

  void initState() {
    _getData();
    super.initState();
  }

  double _ratingValue;

  bool israte = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            LocaleKeys.enterRate.tr(),
            style: TextStyle(fontFamily: 'dinnextl bold'),
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: loading
            ? SpinKitChasingDots(
                size: 40,
                color: kPrimaryColor,
              )
            : ListView.builder(
                itemCount: _rateModel.data.length,
                itemBuilder: (_, index) {
                  return Stack(
                    children: [
                      Container(
                        height: height * 0.2,
                        width: width * 0.8,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 33),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: kHomeColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Text(_rateModel.data[index].dealerName.toString(),
                                style: TextStyle(fontFamily: "dinnextl bold", fontSize: 16, color: Colors.black)),
                            Text(_rateModel.data[index].deliveryId.toString(),
                                style: TextStyle(fontFamily: "dinnextl medium", fontSize: 14, color: Colors.black)),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(Icons.star,),
                                  // Icon(Icons.star),
                                  // Icon(Icons.star),
                                  //IconButton(icon: TwoStar(), onPressed: null)
                                  SizedBox(
                                    width: width * 0.1,
                                  ),
                                  RatingBar(
                                      initialRating: double.tryParse(_rateModel.data[index].rate.toString()),
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 3,
                                      ratingWidget: RatingWidget(
                                          half: SizedBox(),
                                          full: SizedBox(
                                              height: height * 0.05,
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              )),
                                          empty: SizedBox(
                                            height: height * 0.05,
                                            child: Icon(
                                              Icons.star_outline,
                                              color: Colors.orange,
                                            ),
                                          )),
                                      onRatingUpdate: (value) {
                                        setState(() {
                                          _ratingValue = value;
                                        });
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      Positioned(
                        top: 32,
                        left: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: kAccentColor,
                          ),
                          height: height * 0.13,
                          width: width * 0.3,
                          child: Image.network(
                            (_rateModel.data[index].dealerImage),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ));
  }
}
