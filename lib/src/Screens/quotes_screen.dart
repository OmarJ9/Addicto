import 'dart:math';

import 'package:addicto/src/Constants/assets_path.dart';
import 'package:addicto/src/Constants/consts_variables.dart';
import 'package:addicto/src/Widgets/myflat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Config/size.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                MyAssets.libraryimage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
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
                        child: const Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 3,
                      ),
                      Text(
                        'Motivational Quotes',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: SizeConfig.textMultiplier * 2.3,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildquotecard(context),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 5,
                        ),
                        MyFlatButton(
                          title: 'Shuffle',
                          func: () {
                            var random = Random().nextInt(myquotes.length);
                            setState(() {
                              _index = random;
                            });
                          },
                          color: Colors.green,
                          maxsize: 200,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildquotecard(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: SizeConfig.widthMultiplier * 70,
          height: SizeConfig.heightMultiplier * 63.9,
          child: Card(
            color: Colors.white.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 75,
          height: SizeConfig.heightMultiplier * 62,
          child: Card(
            color: Colors.white.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 82,
          height: SizeConfig.heightMultiplier * 60,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#quote  #addiction  #recovery  #motivation',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Colors.blue),
                  ),
                  const Spacer(),
                  const Icon(
                    FontAwesomeIcons.quoteLeft,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    myquotes[_index].quote,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: SizeConfig.textMultiplier * 3,
                        color: Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        FontAwesomeIcons.quoteRight,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.right,
                    myquotes[_index].author,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
