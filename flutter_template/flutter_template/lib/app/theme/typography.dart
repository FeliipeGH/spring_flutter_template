import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/app/theme/colors.dart';


class MainTypography{

  static TextStyle headlineTextStyle = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 26,
          color: MainColors.textPrimary,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500));

  static TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 20, color: MainColors.textPrimary, fontWeight: FontWeight.w300));

  static TextStyle subtitleTextStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: 14, color: MainColors.textSecondary, letterSpacing: 1));

  static TextStyle bodyTextStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: 14, color: MainColors.textPrimary));

  static TextStyle buttonTextStyle = GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 18, color: MainColors.textPrimary, letterSpacing: 1));

  static TextStyle menuListTileDefaultText =
  TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle menuListTileSelectedText =
  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle cardTileSubText =
  TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal);
  static TextStyle cardTileTitleText =
  TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle cardTileMainText =
  TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle cardTitleTextStyle = TextStyle(fontSize: 18, color: Colors.black87);
}