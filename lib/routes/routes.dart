import 'package:flutter/material.dart';
import 'package:sotl/view/screens/admin/screens/add_user/add_user_screen.dart';
import '../view/screens/admin/admin.dart';
import '../view/screens/admin/screens/initiate_observation/initiate_observation_screen.dart';
import '../view/screens/common/screens/change_password/change_password_screen.dart';
import '../view/screens/admin/screens/dashboard/dashboard_screen.dart';
import '../view/screens/faculty/faculty.dart';
import '../view/screens/faculty/screens/course/course_screen.dart';
import '../view/screens/faculty/screens/observation/observation_screen.dart';
import '../view/screens/common/screens/forgot_password/forgot_password_screen.dart';
import '../view/screens/common/screens/login/login_screen.dart';
import '../view/screens/admin/screens/observation/observation_screen.dart';
import '../view/screens/common/screens/otp/otp_verification_screen.dart';
import '../view/screens/common/screens/profile/profile_screen.dart';
import '../view/screens/common/screens/rubrics/rubrics_screen.dart';
import '../view/screens/common/screens/settings/settings_screen.dart';
import '../view/screens/common/screens/splash/splash_screen.dart';
import '../view/screens/admin/screens/users/users_screen.dart';
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

      case RoutesName.dashboard:
        return getPageRoute(DashboardScreen());

      case RoutesName.users:
        return getPageRoute(UsersScreen());

      case RoutesName.addUser:
        return getPageRoute(AddUserScreen());

      case RoutesName.observations:
        return getPageRoute(ObservationScreen());

      case RoutesName.settings:
        return getPageRoute(const SettingsScreen());

      case RoutesName.profile:
        return getPageRoute(const ProfileScreen());

      case RoutesName.admin:
        return getPageRoute(const Admin());

      case RoutesName.faculty:
        return getPageRoute(const Faculty());

      case RoutesName.facultyCourse:
        return getPageRoute(FacultyCourseScreen());

      case RoutesName.facultyObservation:
        return getPageRoute(FacultyObservationScreen());

      case RoutesName.initiateObservation:
        return getPageRoute(InitiateObservationScreen());

      case RoutesName.rubrics:
        return getPageRoute(const RubricScreen());
      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
