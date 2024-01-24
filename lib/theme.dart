import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff5843BE);
Color orange = const Color(0xffFF9376);
Color blackColor = const Color(0xff000000);
Color white = const Color(0xffFFFFFF);
Color greyTextsatu = const Color(0xff7A7E86);
Color greyTextdua = const Color(0xff82868E);

double edge = 24;

TextStyle blacktittleStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: blackColor);

TextStyle whiteTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: white);

TextStyle greyTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: greyTextsatu,
);

TextStyle purppleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: primaryColor,
);

TextStyle regularTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: blackColor,
);
