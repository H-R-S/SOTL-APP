import 'package:flutter/material.dart';
import '../../../resources/constants/logos.dart';
import '../../../resources/constants/style.dart';
import '../../../resources/validator/validator.dart';
import '../../../routes/routes_name.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/snack_bar/my_snack_bar.dart';
import '../../widgets/text_field/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.all(20).copyWith(top: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(iqraLogo, height: 250),
                          const SizedBox(height: 15),
                          const Text("SOTL SYSTEM",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          const Text("Please Sign-in to your account",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                          const SizedBox(height: 15),
                          MyTextField(
                              validator: (value) =>
                                  Validator.validateEmail(value),
                              controller: emailController,
                              hint: "Email"),
                          MyTextField(
                              validator: (value) =>
                                  Validator.validatePassword(value),
                              isPassword: true,
                              isVisible: true,
                              controller: passwordController,
                              hint: "Password"),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.forgotPassword);
                                    },
                                    child: const Text("Forgot Password?",
                                        style: TextStyle(
                                            fontSize: 16, color: primary)))
                              ]),
                          const SizedBox(height: 15),
                          MyElevatedButton(
                              onTap: () {
                                final isValidate =
                                    formKey.currentState!.validate();

                                if (isValidate) {
                                  MySnackBar(context, "Login successfully");
                                }
                              },
                              title: "Login"),
                        ])))));
  }
}
