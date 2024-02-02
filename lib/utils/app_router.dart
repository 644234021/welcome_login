import 'package:welcome_login/screens/home/home_screens.dart';
import 'package:welcome_login/screens/login/login_screen.dart';
//import 'package:welcome_login/screens/register/register_screen.dart';
import 'package:welcome_login/screens/welcome/welcome_screen.dart';

class AppRouter {
  // Router Map Key
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String home = 'home';
//  static const String register = 'register';

  static get routes => {
        welcome: (context) => const WelcomeScreen(),
//        register: (context) => RegisterScreen(),
        login: (context) => LoginScreen(),
        home: (context) => HomeScreen(),
      };
}
