import 'package:addicto/src/Constants/assets_path.dart';
import 'package:addicto/src/Models/onboarding_model.dart';

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
