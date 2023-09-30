import 'package:flutter/material.dart';
import 'package:sotl/view/screens/admin/screens/add_course/add_course_screen.dart';
import 'package:sotl/view/screens/admin/screens/add_user/add_user_screen.dart';
import 'package:sotl/view/screens/admin/screens/assigned_course/assigned_course_screen.dart';
import 'package:sotl/view/screens/admin/screens/courses/courses_screen.dart';
import 'package:sotl/view/screens/common/screens/change_user_password/change_user_password_screen.dart';
import 'package:sotl/view/screens/common/screens/notification/notification_screen.dart';
import 'package:sotl/view/screens/observer/observer.dart';
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
        return getPageRoute(const OtpVerificationScreen());

      case RoutesName.changePassword:
        return getPageRoute(ChangePasswordScreen());

      case RoutesName.changeUserPassword:
        return getPageRoute(const ChangeUserPasswordScreen());

      case RoutesName.dashboard:
        return getPageRoute(const DashboardScreen());

      case RoutesName.users:
        return getPageRoute(const UsersScreen());

      case RoutesName.addUser:
        return getPageRoute(const AddUserScreen());

      case RoutesName.observations:
        return getPageRoute(const ObservationScreen());

      case RoutesName.course:
        return getPageRoute(const CoursesScreen());

      case RoutesName.addCourse:
        return getPageRoute(AddCourseScreen());

      case RoutesName.assignedCourse:
        return getPageRoute(const AssignedCourseScreen());

      case RoutesName.settings:
        return getPageRoute(const SettingsScreen());

      case RoutesName.profile:
        return getPageRoute(const ProfileScreen());

      case RoutesName.admin:
        return getPageRoute(const Admin());

      case RoutesName.faculty:
        return getPageRoute(const Faculty());

      case RoutesName.facultyCourse:
        return getPageRoute(const FacultyCourseScreen());

      case RoutesName.facultyObservation:
        return getPageRoute(const FacultyObservationScreen());

      case RoutesName.initiateObservation:
        return getPageRoute(const InitiateObservationScreen());

      case RoutesName.rubrics:
        return getPageRoute(const RubricScreen());

      case RoutesName.observer:
        return getPageRoute(const Observer());

      case RoutesName.notification:
        return getPageRoute(const NotificationScreen());

      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
