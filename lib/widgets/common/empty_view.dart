import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.smart_toy,
            size: 28.w,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "No Game Found",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  //fontFamily: GoogleFonts.abel().fontFamily,
                  wordSpacing: 2.r,
                ),
          ),
        ],
      ),
    );
  }
}
