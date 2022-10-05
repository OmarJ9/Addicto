import 'package:addicto/src/Screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../Constants/strings.dart';
import '../Screens/homescreen.dart';

class AppRoute {
  AppRoute();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        {
          return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
        }
      case homescreen:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }

      default:
        throw 'No Page Found!!';
    }
  }
}
