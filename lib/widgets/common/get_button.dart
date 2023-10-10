import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetButton extends StatelessWidget {
  const GetButton({
    Key? key,
    this.buttonText,
    this.buttonFunction,
  }) : super(key: key);

  final String? buttonText;
  final Function()? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
          elevation: 5,
        ),
        onPressed: buttonFunction,
        child: Text(
          buttonText!,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14.sp,
              ),
        ),
      ),
    );
  }
}
