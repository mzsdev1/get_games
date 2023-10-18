// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderPriceText extends StatelessWidget {
  const SliderPriceText({
    Key? key,
    required this.label,
    required this.priceData,
  }) : super(key: key);
  final String label;
  final String priceData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.w,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          priceData,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 13.sp,
              ),
        ),
      ],
    );
  }
}
