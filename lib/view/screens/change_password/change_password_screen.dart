import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../../resources/validator/validator.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/snack_bar/my_snack_bar.dart';
import '../../widgets/text_field/my_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),   
      child: SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: primary)),
            body: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.all(20).copyWith(top: 100),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Create new Password",
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 15),
                              const Text("Create your new password to login",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.normal)),
                              const SizedBox(height: 40),
                              MyTextField(
                                  validator: (value) =>
                                      Validator.validatePassword(value),
                                  isPassword: true,
                                  isVisible: true,
                                  controller: passwordController,
                                  hint: "Password"),
                              MyTextField(
                                  validator: (value) =>
                                      Validator.validateConfirmPassword(
                                          value, passwordController.text),
                                  isPassword: true,
                                  isVisible: true,
                                  controller: confirmPasswordController,
                                  hint: "Confirm Password"),
                              const SizedBox(height: 60),
                              MyElevatedButton(
                                  title: "Submit Password", onTap: () {
                                    final isValidate =
                                        formKey.currentState!.validate();
          
                                    if (isValidate) {
                                      MySnackBar(context, "Login successfully");
                                    }
                                  })
                            ]))))),
      ),
    );
  }
}
