import 'package:flutter/material.dart';
import 'package:sotl/view/screens/change_password/change_password_screen.dart';
import '../view/screens/forgot_password/forgot_password_screen.dart';
import '../view/screens/login/login_screen.dart';
import '../view/screens/otp/otp_verification_screen.dart';
import '../view/screens/splash/splash_screen.dart';
import 'routes_name.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case RoutesName.splash:
        return getPageRoute(const SplashScreen());

      case RoutesName.login:
        return getPageRoute(LoginScreen());

      case RoutesName.forgotPassword:
        return getPageRoute(ForgotPasswordScreen());
      
      case RoutesName.otp:
        return getPageRoute(OtpVerificationScreen());
      
      case RoutesName.changePassword:
        return getPageRoute(ChangePasswordScreen());
      
      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}