import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/assets_path.dart';
import 'package:addicto/src/Models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<OnBoardingModel> onboardinglist = const [
  OnBoardingModel(
      img: MyAssets.onboradingone,
      title: "Stop Your Addiction",
      content:
          "This app will help you stop your addiction by providing a lot of tools to stop it."),
  OnBoardingModel(
      img: MyAssets.onboradingtwo,
      title: "Recomended Books",
      content:
          "This app will provide you with the top recomended books that talk about addiction and how to cure it."),
  OnBoardingModel(
      img: MyAssets.onboradingthree,
      title: "Motivation",
      content:
          "You will be provided by daily quotes to motivate you along your journey.")
];
List<Tab> mytabs = [
  Tab(
    height: 70,
    text: 'Po*n',
    icon: Icon(
      FontAwesomeIcons.p,
      size: SizeConfig.heightMultiplier * 4,
      color: const Color.fromARGB(255, 13, 90, 15),
    ),
  ),
  Tab(
    height: 70,
    text: 'Drugs',
    icon: Icon(
      FontAwesomeIcons.pills,
      size: SizeConfig.heightMultiplier * 4,
      color: const Color.fromARGB(255, 13, 90, 15),
    ),
  ),
  Tab(
    height: 70,
    text: 'Alcohol',
    icon: Icon(
      FontAwesomeIcons.wineBottle,
      size: SizeConfig.heightMultiplier * 4,
      color: const Color.fromARGB(255, 13, 90, 15),
    ),
  ),
  Tab(
    height: 70,
    text: 'Internet',
    icon: Icon(
      FontAwesomeIcons.wifi,
      size: SizeConfig.heightMultiplier * 4,
      color: const Color.fromARGB(255, 13, 90, 15),
    ),
  ),
];
