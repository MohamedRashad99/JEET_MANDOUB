import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/home/view.dart';
import 'package:jeet/screens/login/view.dart';
import 'package:jeet/screens/signUp/provider.dart';
import 'package:jeet/widgets/smallButton.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class WelComeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    getToken() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final String token = preferences.getString("token");
      print(" Token = \t $token ");
      if (token == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      } else {
        var provider = Provider.of<SignUpProvider>(context, listen: false);
        provider.setToken(token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    }
    return Scaffold(

      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: height*.2,),
          Text(LocaleKeys.welcomeIn.tr(),
            style: TextStyle(
              fontFamily: "dinnextl bold",
              fontSize:26,),),
          SizedBox(height: height*.15,),
          SizedBox(
              height: height*.15,
              child: Image.asset('assets/images/sLogo.png')),

          SizedBox(height: height*.15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallButton(onPressed: (){
                getToken();
                context.locale = Locale('en', 'US');
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginView()));
              }, title: "English",),
              SmallButton(onPressed: (){
                getToken();
                context.locale = Locale('ar', 'EG');
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginView()));
              }, title: "العربية",color: kPrimaryColor,),
            ],
          ),
        ],
      ),
    );
  }
}
