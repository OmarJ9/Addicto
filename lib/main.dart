import 'package:addicto/src/Config/route.dart';
import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/strings.dart';
import 'package:addicto/src/Constants/themes.dart';
import 'package:addicto/src/Models/challenge_model.dart';
import 'package:addicto/src/Provider/books_provider.dart';
import 'package:addicto/src/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChallengeAdapter());
  await Hive.openBox('primitiveBox');
  await Hive.openBox('challengeBox');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [
    SystemUiOverlay.bottom,
  ]);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider()..init()),
      ChangeNotifierProvider<BooksProvider>(
          create: (_) => BooksProvider()..init(), lazy: false),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        return Consumer<HomeProvider>(
          builder: (context, provider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: MyThemes.light,
            darkTheme: MyThemes.dark,
            themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRoute().generateRoute,
            initialRoute: provider.seen ? homescreen : onboarding,
          ),
        );
      },
    );
  }
}
