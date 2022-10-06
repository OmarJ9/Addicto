import 'package:addicto/src/Screens/books_screen.dart';
import 'package:addicto/src/Screens/onboarding_screen.dart';
import 'package:addicto/src/Screens/quotes_screen.dart';
import 'package:addicto/src/Screens/test_screen.dart';
import 'package:flutter/material.dart';

import '../Constants/strings.dart';
import '../Screens/home_screen.dart';

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
      case bookscreen:
        {
          return MaterialPageRoute(builder: (_) => const BookScreen());
        }
      case testscreen:
        {
          return MaterialPageRoute(builder: (_) => const TestScreen());
        }
      case quotescreen:
        {
          return MaterialPageRoute(builder: (_) => const QuoteScreen());
        }

      default:
        throw 'No Page Found!!';
    }
  }
}
