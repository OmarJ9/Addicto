import 'package:flutter/material.dart';
import 'package:addicto/src/Constants/consts_variables.dart';
import '../Config/size.dart';

class OnBoardPage extends StatelessWidget {
  final int index;

  const OnBoardPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 13,
        ),
        Image.asset(
          onboardinglist[index].img,
          fit: BoxFit.cover,
          height: SizeConfig.heightMultiplier * 38,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        Text(
          onboardinglist[index].title,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 3,
        ),
        Text(
          onboardinglist[index].content,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
