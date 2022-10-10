import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/consts_variables.dart';
import 'package:addicto/src/Constants/strings.dart';
import 'package:addicto/src/Widgets/myflat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 15,
            bottom: 20,
            right: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  Text(
                    'Test Categories',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2.3,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Text(
                textAlign: TextAlign.center,
                'Tip: You have 10 questions in each category, answer them carefully to see how much you are really addicted !',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: Colors.grey),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 6,
              ),
              Expanded(
                child: Column(
                  children: [
                    _choiceButton(
                      "Porn Addiction Choice",
                      Colors.amber,
                      () {
                        Navigator.pushNamed(context, testscreen,
                            arguments: addictionquestions[0]);
                      },
                    ),
                    _choiceButton(
                      "Drugs Addiction Choice",
                      Colors.blueGrey,
                      () {
                        Navigator.pushNamed(context, testscreen,
                            arguments: addictionquestions[1]);
                      },
                    ),
                    _choiceButton(
                      "Alcohol Addiction Choice",
                      Colors.red,
                      () {
                        Navigator.pushNamed(context, testscreen,
                            arguments: addictionquestions[2]);
                      },
                    ),
                    _choiceButton(
                      "Internet Addiction Choice",
                      Colors.blue,
                      () {
                        Navigator.pushNamed(context, testscreen,
                            arguments: addictionquestions[3]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _choiceButton(String title, Color color, void Function() func) {
    return Column(
      children: [
        MyFlatButton(
          title: title,
          func: func,
          color: color,
          maxsize: SizeConfig.widthMultiplier * 80,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 5,
        )
      ],
    );
  }
}
