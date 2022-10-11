import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/colors.dart';
import 'package:addicto/src/Constants/strings.dart';
import 'package:addicto/src/Utils/Services/hive_helper.dart';
import 'package:addicto/src/Widgets/mycircular_button.dart';
import 'package:addicto/src/Widgets/myflat_button.dart';
import 'package:addicto/src/Widgets/onBoard_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int _currentpage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.heightMultiplier * 5,
            left: SizeConfig.widthMultiplier * 5,
            right: SizeConfig.widthMultiplier * 5,
          ),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                itemCount: 3,
                controller: _controller,
                itemBuilder: (context, index) {
                  return OnBoardPage(
                    index: index,
                  );
                },
                onPageChanged: (page) {
                  setState(() {
                    _currentpage = page;
                  });
                },
              )),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const SlideEffect(
                  activeDotColor: MyColors.green,
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              _currentpage == 2
                  ? MyFlatButton(
                      title: 'Get Started',
                      func: () {
                        HiveHelper().savePrimitives('seen', true);
                        Navigator.pushReplacementNamed(context, homescreen);
                      },
                      color: MyColors.green,
                      maxsize: SizeConfig.widthMultiplier * 80,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyFlatButton(
                          title: 'Skip Screen',
                          func: () {
                            _controller.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.decelerate,
                            );
                          },
                          color: MyColors.green,
                          maxsize: SizeConfig.widthMultiplier * 50,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 5,
                        ),
                        MyCircularButton(
                          icon: Icons.chevron_right,
                          func: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.decelerate,
                            );
                          },
                          color: MyColors.green,
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
