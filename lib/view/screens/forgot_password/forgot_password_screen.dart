import 'package:flutter/material.dart';
import '../../../resources/constants/images.dart';
import '../../../resources/constants/style.dart';
import '../../../resources/validator/validator.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/text_field/my_text_field.dart';
import '../otp/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

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
                              const Text("Forgot Password",
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 15),
                              const Text(
                                  "Forgot your account's password or having trouble logging in? Enter your email address and we'll send you a recovery link.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                              const SizedBox(height: 40),
                              Center(child: Image.asset(forgotPasswordImage)),
                              const SizedBox(height: 40),
                              MyTextField(
                                  validator: (value) =>
                                      Validator.validateEmail(value),
                                  controller: emailController,
                                  hint: "Email Address"),
                              const SizedBox(height: 15),
                              MyElevatedButton(
                                  title: "Submit",
                                  onTap: () {
                                    final isValidate =
                                        formKey.currentState!.validate();
      
                                    if (isValidate) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OtpVerificationScreen(
                                                      email:
                                                          emailController.text)));
                                    }
                                  })
                            ]))))),
      ),
    );
  }
}
