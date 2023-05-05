import 'package:flutter/material.dart';
import '../home.dart';
import '../view/screens/change_password/change_password_screen.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/faculty/faculty.dart';
import '../view/screens/faculty/screens/course/course_screen.dart';
import '../view/screens/faculty/screens/observation/observation_screen.dart';
import '../view/screens/forgot_password/forgot_password_screen.dart';
import '../view/screens/login/login_screen.dart';
import '../view/screens/observation/observation_screen.dart';
import '../view/screens/otp/otp_verification_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/settings/settings_screen.dart';
import '../view/screens/splash/splash_screen.dart';
import '../view/screens/users/users_screen.dart';
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

      case RoutesName.home:
        return getPageRoute(Home());

      case RoutesName.dashboard:
        return getPageRoute(DashboardScreen());

      case RoutesName.users:
        return getPageRoute(UsersScreen());

      case RoutesName.observations:
        return getPageRoute(ObservationScreen());

      case RoutesName.settings:
        return getPageRoute(SettingsScreen());

      case RoutesName.profile:
        return getPageRoute(ProfileScreen());

      case RoutesName.faculty:
        return getPageRoute(Faculty());

      case RoutesName.facultyCourse:
        return getPageRoute(FacultyCourseScreen());

      case RoutesName.facultyObservation:
        return getPageRoute(FacultyObservationScreen());

      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
