import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateContainer extends StatelessWidget {
  const RateContainer({
    Key? key,
    this.rateTitle,
    this.infoWidget,
  }) : super(key: key);

  final String? rateTitle;
  final Widget? infoWidget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5).r,
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(13).r,
          boxShadow: [
            BoxShadow(
              //color: Colors.grey.withOpacity(0.5),
              color: Theme.of(context).shadowColor.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              rateTitle!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            infoWidget!,
          ],
        ),
      ),
    );
  }
}
