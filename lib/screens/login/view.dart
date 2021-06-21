import 'package:flutter/material.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/screens/forgetPassword/view.dart';
import 'package:jeet/screens/login/Data/controller.dart';
import 'package:jeet/screens/signUp/view.dart';
import 'package:jeet/screens/statusOrders/view.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';
import 'package:queen_validators/queen_validators.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  bool isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      final phoneNo = _phoneController.text.trim();
      final password = _passwordController.text.trim();
      setState(() {
        isLoading = true;
      });
      SignInController().SignIn(context: context, num: phoneNo, pass: password).then((value) {
        setState(() {
          isLoading = false;
        });
      });
      print('$phoneNo $password');

      print('navigate to home screen');
      return;
    } else {
      print('show snack bar with error');
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Image.asset(
                "assets/images/reg.png",
                height: height * 0.3,
              ),
              //password
              Text(
                LocaleKeys.signIn.tr(),
                style: TextStyle(fontSize: 35, fontFamily: "dinnextl bold"),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                dIcon: Icons.phone_android_rounded,
                label: true,
                type: TextInputType.phone,
                valid: qValidator([
                  // RegExpRule(''),

                  IsRequired(LocaleKeys.enterPhone.tr()),
                  MinLength(5),
                ]),
                controller: _phoneController,
              ),
              CustomTextField(
                icon: Icons.lock_outline,
                dIcon: Icons.lock_outline,
                hint: LocaleKeys.password.tr(),
                type: TextInputType.number,
                valid: qValidator([
                  IsRequired(LocaleKeys.enterPhone.tr()),
                  MinLength(5),
                ]),
                controller: _passwordController,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 140),
                  child: Text(
                    LocaleKeys.forgotPassword.tr(),
                    style: TextStyle(color: kPrimaryColor, fontFamily: "dinnextl bold", fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomButton(
                isLoading: isLoading,
                onPressed: _submit,
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                title: LocaleKeys.signIn.tr(),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.donHave.tr(),
                    style: TextStyle(color: kTextColor, fontFamily: "dinnextl bold", fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
                    },
                    child: Text(
                      LocaleKeys.signup.tr(),
                      style: TextStyle(color: kPrimaryColor, fontFamily: "dinnextl bold", fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
