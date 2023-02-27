import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/snack_bar/my_snack_bar.dart';
import '../../../resources/constants/images.dart';
import '../../../resources/constants/style.dart';
import '../../../routes/routes_name.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/button/my_text_button.dart';
import '../../widgets/otp_form_field/otp_form_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String? email;

  OtpVerificationScreen({super.key, this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController1 = TextEditingController();

  TextEditingController otpController2 = TextEditingController();

  TextEditingController otpController3 = TextEditingController();

  TextEditingController otpController4 = TextEditingController();

  int remainingTime = 59;

  bool wait = false;

  void startTimer() {
    Timer timer = Timer.periodic(const Duration(seconds: 1), (time) {
      if (remainingTime != 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        setState(() {
          wait = false;
          time.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: primary),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MyTextButton(
                      title: "Change Email",
                      onTap: () {
                        Navigator.pop(context);
                      }))
            ]),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Enter authentication code",
                          style: TextStyle(
                              color: primary,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Text(
                          "Enter the 4-digit that we have sent via the email ${widget.email}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                      const SizedBox(height: 40),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpFormField(controller: otpController1),
                            OtpFormField(controller: otpController2),
                            OtpFormField(controller: otpController3),
                            OtpFormField(controller: otpController4)
                          ]),
                      const SizedBox(height: 40),
                      Image.asset(otpVerificationImage),
                      const SizedBox(height: 40),
                      MyElevatedButton(
                          title: "Submit",
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.changePassword);
                          }),
                      MyTextButton(
                          title: wait
                              ? "Resend Code after $remainingTime seconds"
                              : "Resend Code",
                          onTap: () {
                            MySnackBar(context, "Code Resend successfully");
                            setState(() {
                              startTimer();

                              setState(() {
                                remainingTime = 59;
                                wait = true;
                              });
                            });
                          })
                    ]))));
  }
}
