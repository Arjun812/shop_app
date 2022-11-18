

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppColors {
  static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);

  // elemnts
  static const Color primaryColor = Color.fromARGB(255,99,102,241);


  //text
  static const Color primaryText = Color.fromARGB(255, 28, 28, 28);
}


class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color:  Color(0x4d727c8e),
    width: 1,
    style: BorderStyle.solid,
  );
  static const BorderSide secondaryBorder = BorderSide(
    color: Color.fromARGB(255, 209, 165, 75),
    width: 1.5,
    style: BorderStyle.solid,
  );
}

///Gradients

class Gradients {
  static const Gradient primaryGradient = LinearGradient(colors: [ Color.fromARGB(255,99,102,241),  Color.fromARGB(255,99,102,241)], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static const secandaryGradient = LinearGradient(colors: [Color(0xffFBFBFC), Color(0xffD3DAE7)], stops: [0, 1], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00));
}

class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(20, 209, 165, 75),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(20, 0, 0, 0),
    offset: Offset(0, 2),
    blurRadius: 6,
  );
}

class TextStyles {
  static final headerStyle = GoogleFonts.roboto(textStyle: const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  ));
  static final subHeaderStyle = GoogleFonts.roboto(textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ));

  static final normalStyle = GoogleFonts.roboto(textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ));

  static final whiteTextStyle = GoogleFonts.roboto(textStyle: const TextStyle(
      color: Colors.white
  ));
  static final blackTextStyle = GoogleFonts.roboto(textStyle: const TextStyle(
      color: Colors.black
  ));
}