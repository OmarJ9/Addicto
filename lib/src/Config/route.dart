import 'package:addicto/src/Screens/categories_screen.dart';
import 'package:addicto/src/Screens/books_screen.dart';
import 'package:addicto/src/Screens/onboarding_screen.dart';
import 'package:addicto/src/Screens/quotes_screen.dart';
import 'package:addicto/src/Screens/test_screen.dart';
import 'package:addicto/src/Screens/webpage_screen.dart';
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
          final questions = settings.arguments as List<String>;
          return MaterialPageRoute(
              builder: (_) => TestScreen(
                    questions: questions,
                  ));
        }
      case testwelcomescreen:
        {
          return MaterialPageRoute(builder: (_) => const CategoriesScreen());
        }
      case quotescreen:
        {
          return MaterialPageRoute(builder: (_) => const QuoteScreen());
        }
      case webpagescreen:
        {
          final website = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) => WebPageScreen(
                    website: website,
                  ));
        }

      default:
        throw 'No Page Found!!';
    }
  }
}
