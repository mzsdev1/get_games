import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadProgressIndicator extends StatelessWidget {
  const LoadProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: Theme.of(context).indicatorColor,
        size: 42.w,
      ),
    );
  }
}
