import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../../routes/routes_name.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.forgotPassword);
          },
          child: Text("Forgot Password?",
              style: Styles.h3.copyWith(color: primary)))
    ]);
  }
}
