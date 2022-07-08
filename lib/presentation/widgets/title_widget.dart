import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double fsize;
  const TitleWidget({Key? key, required this.title, this.fsize = 26})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.signikaNegative(
          fontSize: fsize, fontWeight: FontWeight.bold),
    );
  }
}
