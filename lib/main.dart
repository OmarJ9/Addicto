import 'package:addicto/src/Config/route.dart';
import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/strings.dart';
import 'package:addicto/src/Constants/themes.dart';
import 'package:addicto/src/Models/challenge_model.dart';
import 'package:addicto/src/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChallengeAdapter());
  await Hive.openBox('primitiveBox');
  await Hive.openBox('challengeBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider()..init(),
      child: const MyApp(),
    ),
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: MyThemes.light,
          darkTheme: MyThemes.dark,
          onGenerateRoute: AppRoute().generateRoute,
          initialRoute: homescreen,
        );
      },
    );
  }
}
