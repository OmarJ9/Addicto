import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/assets_path.dart';
import 'package:addicto/src/Models/onboarding_model.dart';
import 'package:addicto/src/Models/quote_model.dart';
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
      title: "Recommended Books",
      content:
          "This app will provide you with the top recommended books that talk about addiction and how to cure it."),
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

List<List<String>> addictionquestions = [
  [
    'Have you ever tried to quit watching pornography but you could not ?',
    'Have you ever kept watching pornography though you knew it is destroying your life ?',
    'Do you watch pornography when you feel stressed',
    'Do you have any problems related to pornography but you keep watching it ?',
    'Do you feel guilty after finishing watching pornography ?',
    'Do you spend a lot of time thinking about pornography?',
    'Do you watch pornography more than twice a day ?',
    'Have you ever lied about how much porn you actually watch?',
    'Has pornography ever interfered with your work, school, or relationships?',
    'Have you ever done anything illegal to access porn?',
  ],
  [
    'Have you ever used anything illegal to buy drugs?',
    'Have you ever tried to quit using drugs but you could not ?',
    'Do you smoke more than 20 cigarettes a day ?',
    'Have you ever sold your items just to buy drugs ?',
    'Do you have any problems related to drugs',
    'Have drugs interfered with your relationships or work ?',
    'Are you losing your money because of drugs ?',
    'Do you feel guilty after smoking a cigarette ?',
    'Do you use more than one type of drugs ?',
    'Have you ever done any crime because of drugs ?',
  ],
  [
    'Do you drink the whole night ?',
    'Have you ever lost full control when you are drunk ?',
    'Have you ever done any crime because of Alcohol ?',
    'Have you tried to stop drinking, but you could not',
    'Did your family got affected by your drinking addiction ?',
    'Do you feel guilty after waking up ?',
    'Have you lost some of your physical abilities because of drinking ?',
    'Do you think about Alcohol when you get stressed ?',
    'Do you use drugs with alcohol ?',
    'Would you feel happier if you drink more ?',
  ],
  [
    'Do you use social media when you are at work ?',
    'Do you keep watching YouTube until you get slept ?',
    'Do you keep counting how much likes does your pic got ?',
    'The first think you do when you wake up is opening your Facebook account ?',
    'Have you ever tried to delete you social media accounts, but you could not ?',
    'Do you prefer social media life over your real life ?',
    'Do you feel stressed when you do not use social media ?',
    'Do you prefer using social media over study ?',
    'Do you keep watching non sense videos ?',
    'Do you thing you are addicted to internet ?',
  ]
];
List<QuoteModel> myquotes = [
  QuoteModel(
    quote: "It Does Not Matter How Slowly You Go As Long As You Do Not Stop.",
    author: "Confucius",
  ),
  QuoteModel(
    quote:
        "Recovery Is An Acceptance That Your Life Is In Shambles And You Have To Change.",
    author: "Jamie Lee",
  ),
  QuoteModel(
    quote: "Recovery Is Something That You Have To Work On Every Single Day",
    author: "Demi Lovato",
  ),
  QuoteModel(
    quote:
        "Recovery Is Not For People Who Need It, It's For People Who Want It.",
    author: "Anonymous",
  ),
  QuoteModel(
    quote: "Quitting smoking is easy. I've done it a hundred times.",
    author: "Mark Twain",
  ),
  QuoteModel(
    quote: "If you can quit for a day, you can quit for a lifetime.",
    author: "Benjamine Alire",
  ),
  QuoteModel(
    quote: "Fall seven times, stand up eight.",
    author: "Japanese Proverb",
  ),
  QuoteModel(
    quote: "One of the hardest things was learning that I was worth recovery.",
    author: "Demi Lovato",
  ),
  QuoteModel(
    quote:
        "You can get the monkey off your back, but the circus never leaves town.",
    author: "Anne Lamott",
  ),
  QuoteModel(
    quote: "Once you learn to quit, it becomes a habit.",
    author: "Vince Lombardi",
  ),
];
