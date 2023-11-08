// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/widgets/common/error_image.dart';
// import 'package:get_games/widgets/free_games/main_rich_text.dart';

// class FreeGamesMainCardBody extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String platforms;
//   final String price;

//   const FreeGamesMainCardBody({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.platforms,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       //color: Colors.green,
//       //elevation: 2.0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Flexible(
//             flex: 2,
//             child: CachedNetworkImage(
//               imageUrl: imagePath,
//               fit: BoxFit.fill,
//               errorWidget: (context, url, error) => const ErrorImage(),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 8.r,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Text(
//                       title,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14.sp,
//                           ),
//                     ),
//                   ),
//                   SizedBox(height: 3.5.h),
//                   MainRichText(
//                     title: 'Platforms: ',
//                     data: platforms,
//                   ),
//                   SizedBox(height: 3.5.h),
//                   MainRichText(title: 'Price: ', data: price),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//todo.
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/ui/widgets/common/error_image.dart';
import 'package:get_games/ui/widgets/free_games/main_rich_text.dart';

class FreeGamesMainCardBody extends StatelessWidget {
  final String imagePath;
  final String title;
  final String platforms;
  final String price;

  const FreeGamesMainCardBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.platforms,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: 1.sw,
            height: 146.h,
            imageUrl: imagePath,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const ErrorIcon(),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
                  SizedBox(height: 3.5.h),
                  MainRichText(
                    title: "${LocaleKeys.freeGamesView_platformsText.tr()}: ",
                    data: platforms,
                  ),
                  SizedBox(height: 3.5.h),
                  MainRichText(
                      title: "${LocaleKeys.commonTexts_priceText.tr()}: ",
                      data: price),
                  SizedBox(height: 3.5.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
