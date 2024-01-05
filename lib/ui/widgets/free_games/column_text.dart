// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnText extends StatelessWidget {
  const ColumnText({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            data,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                ),
          ),
        ],
      ),
    );
  }
}
