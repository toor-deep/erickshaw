import 'package:erickshawapp/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:erickshawapp/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:erickshawapp/features/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const MyApp(),
      );
    case '/SignIn':
      return MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      );
    case '/SignUp':
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );
    case '/Home':
      return MaterialPageRoute(builder: (context) => HomeScreen(),);

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      );
  }
}
