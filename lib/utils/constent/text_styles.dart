import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle poppinsText(Color clr, double size, FontWeight weight) {
    return GoogleFonts.poppins(color: clr, fontSize: size, fontWeight: weight);
  }

  static TextStyle robotoText(Color clr, double size, FontWeight weight) {
    return GoogleFonts.roboto(color: clr, fontSize: size, fontWeight: weight);
  }

  static TextStyle syneText(Color clr, double size, FontWeight weight) {
    return GoogleFonts.syne(color: clr, fontSize: size, fontWeight: weight);
  }
}
