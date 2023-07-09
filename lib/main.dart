import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';
import 'routes/routes_name.dart';
import 'theme/theme_colors.dart';
import 'view_models/auth/auth_view_model.dart';
import 'view_models/course/course_view_model.dart';
import 'view_models/user/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
          ChangeNotifierProvider(create: (context) => CourseViewModel()),
          ChangeNotifierProvider(create: (context) => UserViewModel())
        ],
        builder: (context, snapshot) {
          return MaterialApp(
              theme: themeData().copyWith(useMaterial3: true),
              debugShowCheckedModeBanner: false,
              title: 'SOTL-APP',
              initialRoute: RoutesName.splash,
              onGenerateRoute: Routes.generateRoute);
        });
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
