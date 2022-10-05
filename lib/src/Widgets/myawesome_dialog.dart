import 'package:addicto/src/Config/size.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class MyAwesomeDialog {
  static AwesomeDialog buildawosomedialog(
      BuildContext context, int challengedays) {
    return AwesomeDialog(
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'The Challenge is won!',
        btnOkOnPress: () {},
        context: context,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // ignore: sort_child_properties_last
          child: Text(
            textAlign: TextAlign.left,
            'Congratulations Bro/Sis, You have finished your $challengedays days challenge.',
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
