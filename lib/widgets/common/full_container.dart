import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FullContainer extends StatelessWidget {
//   final String header;
//   final String? info;
//   const FullContainer({
//     Key? key,
//     required this.header,
//     required this.info,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.teal,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 9),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               header,
//             ),
//             Text(
//               info!,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class FullContainer extends StatelessWidget {
  final String header;
  final String? info;
  const FullContainer({
    Key? key,
    required this.header,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: const EdgeInsets.symmetric(vertical: 5).r,
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(13).r,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(height: 10.h),
          Text(
            info!,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                ),
          ),
        ],
      ),
    );
  }
}
