import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/changePassword/Data/controller.dart';
import 'package:jeet/widgets/customButton.dart';
import 'package:jeet/widgets/customTextFeild.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:queen_validators/queen_validators.dart';

class ChangePass extends StatefulWidget {
  var phoneNum;
  ChangePass({this.phoneNum});
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void dispose() {
    _conPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0XFFf7f7f7),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Image(alignment: Alignment.center, image: AssetImage("assets/images/lock.png")),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                  child: Text(
                    LocaleKeys.changePassword.tr(),
                    style: TextStyle(fontFamily: "dinnextl bold", fontSize: 30),
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
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
                    CustomTextField(
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      hint: LocaleKeys.confirmPass.tr(),
                      type: TextInputType.number,
                      valid: qValidator([
                        IsRequired(LocaleKeys.enterPhone.tr()),
                        MinLength(5),
                      ]),
                      controller: _conPasswordController,
                    ),
                    SizedBox(
                      height: height * 0.13,
                    ),
                    CustomButton(
                      isLoading: isLoading,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        ChangePassController()
                            .ChangePass_post(
                                context: context, confirmPass: _conPasswordController.text, pass: _passwordController.text, phone: widget.phoneNum)
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      },
                      title: LocaleKeys.confirm.tr(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
