import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_login/screens/home/home_screens.dart';
import 'package:welcome_login/screens/login/login_screen.dart';
import 'package:welcome_login/screens/welcome/welcome_screen.dart';

var initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;

  if (prefs.getBool("homeStatus") == true) {
    initialRoute = "/home";
  }else if (prefs.getBool("welcomeStatus") == true) {
    initialRoute = "/login";
  }else{
    initialRoute = "/welcome";
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComSci Book Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
