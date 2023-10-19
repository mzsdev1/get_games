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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Theme.of(context).colorScheme.secondaryContainer),
      child: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: Wrap(
          spacing: 4.w,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            Text(
              priceData,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 13.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
