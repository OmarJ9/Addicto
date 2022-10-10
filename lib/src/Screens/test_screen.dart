import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Widgets/myflat_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestScreen extends StatefulWidget {
  final List<String> questions;
  const TestScreen({super.key, required this.questions});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _index = 0;
  int _yesanswer = 0;

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
                    'Test Your Addiction',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2.3,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 75,
                    child: LinearProgressIndicator(
                      value: (_index + 1).toDouble() / 10,
                      minHeight: 7,
                      backgroundColor: Colors.green.shade100,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${_index + 1}/10',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: SizeConfig.textMultiplier * 1.7,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      color: Theme.of(context).cardColor,
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.questions[_index],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: SizeConfig.textMultiplier * 3,
                                    color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyFlatButton(
                          title: 'No',
                          func: () {
                            setState(() {
                              if (_index < widget.questions.length - 1) {
                                _index = _index + 1;
                              } else {
                                _index = 0;
                                _awosomedialog(context);
                              }
                            });
                          },
                          color: Colors.red,
                          maxsize: 110,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 7,
                        ),
                        MyFlatButton(
                          title: 'Yes',
                          func: () {
                            setState(() {
                              if (_index < widget.questions.length - 1) {
                                _index = _index + 1;
                                _yesanswer = _yesanswer + 1;
                              } else {
                                _index = 0;
                                _yesanswer = _yesanswer + 1;
                                _awosomedialog(context);
                              }
                            });
                          },
                          color: Colors.green,
                          maxsize: 110,
                        ),
                      ],
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

  AwesomeDialog _awosomedialog(BuildContext context) {
    return AwesomeDialog(
        dialogType: DialogType.noHeader,
        animType: AnimType.scale,
        onDismissCallback: (type) {
          Navigator.pop(context);
        },
        title: 'Test Finished',
        btnOkOnPress: () {},
        context: context,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // ignore: sort_child_properties_last
          child: Text(
            textAlign: TextAlign.left,
            'You are ${_yesanswer / 10 * 100}% Addicted.\nGo and Get A Life !',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 2,
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
          ),
        ))
      ..show();
  }
}
