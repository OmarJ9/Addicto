import 'package:addicto/src/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Config/size.dart';

class MyThemes {
  static var light = ThemeData.light(useMaterial3: true).copyWith(
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: SizeConfig.textMultiplier * 3,
        fontWeight: FontWeight.bold,
        color: MyColors.deepbleu,
      ),
      subtitle1: GoogleFonts.poppins(
        fontSize: SizeConfig.textMultiplier * 2,
        fontWeight: FontWeight.normal,
        color: MyColors.grey,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static var dark = ThemeData.light(useMaterial3: true).copyWith(
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: SizeConfig.textMultiplier * 3,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: GoogleFonts.poppins(
        fontSize: SizeConfig.textMultiplier * 2,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    cardColor: MyColors.lightblack,
    scaffoldBackgroundColor: MyColors.black,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
