import 'dart:math';

import 'package:addicto/src/Constants/colors.dart';
import 'package:flutter/material.dart';

class ColorGenerator {
  int random = Random().nextInt(MyColors.mycolors.length);

  Color generatecolor(int index) {
    if (index < MyColors.mycolors.length) {
      return MyColors.mycolors[index];
    } else {
      return MyColors.mycolors[random];
    }
  }
}
