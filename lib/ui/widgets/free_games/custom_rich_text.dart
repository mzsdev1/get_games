// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12.5.sp,
            ),
        children: <TextSpan>[
          TextSpan(
            text: data,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 12.5.sp),
          ),
        ],
      ),
    );
  }
}
