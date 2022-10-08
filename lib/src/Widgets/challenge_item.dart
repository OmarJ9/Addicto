import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/colors.dart';
import 'package:flutter/material.dart';

class ChallengeItem extends StatelessWidget {
  final int index;
  final int challengedays;
  final String date;
  const ChallengeItem(
      {Key? key,
      required this.index,
      required this.challengedays,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1),
      color: index < MyColors.mycolors.length
          ? MyColors.mycolors[index]
          : MyColors.mycolors[5],
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 1.4,
          horizontal: SizeConfig.widthMultiplier * 1.4,
        ),
        child: Row(
          children: [
            Icon(
              Icons.star_rate,
              color: Colors.amberAccent,
              size: SizeConfig.textMultiplier * 7,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                      text: 'You won a ',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                      children: [
                        TextSpan(
                          text: '$challengedays days ',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                  ),
                        ),
                        TextSpan(
                          text: 'Challenge',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                  ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Text.rich(
                  TextSpan(
                      text: 'You finished on  ',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade100,
                            fontSize: SizeConfig.textMultiplier * 1.5,
                          ),
                      children: [
                        TextSpan(
                          text: date.substring(0, 10),
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent,
                                    fontSize: SizeConfig.textMultiplier * 1.5,
                                  ),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
