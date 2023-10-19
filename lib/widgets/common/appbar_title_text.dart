// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitleText extends StatelessWidget {
  const AppBarTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontFamily: GoogleFonts.bebasNeue().fontFamily,
            letterSpacing: 1.5.r,
            fontSize: 27.sp,
          ),
    );
  }
}
