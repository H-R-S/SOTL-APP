import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/routes.dart';
import 'routes/routes_name.dart';
import 'theme/theme_provider.dart';
import 'view_models/auth/auth_view_model.dart';
import 'view_models/course/course_view_model.dart';
import 'view_models/observation/observation_view_model.dart';
import 'view_models/user/user_view_model.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  final isDark = preferences.getBool("isDark") ?? false;
  runApp(MyApp(isDark: isDark));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp({super.key, this.isDark = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
          ChangeNotifierProvider(create: (context) => CourseViewModel()),
          ChangeNotifierProvider(create: (context) => ObservationViewModel()),
          ChangeNotifierProvider(create: (context) => UserViewModel())
        ],
        child: ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(isDark: widget.isDark),
          builder: (context, child) {
            final theme = Provider.of<ThemeProvider>(context);

            return MaterialApp(
                  theme: theme.currentTheme.copyWith(useMaterial3: true),
                  debugShowCheckedModeBanner: false,
                  title: 'SOTL-APP',
                  initialRoute: RoutesName.splash,
                  onGenerateRoute: Routes.generateRoute);
          }
        )
        );
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
