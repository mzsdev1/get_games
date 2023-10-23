import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/models/free_games_model.dart';
import 'package:get_games/widgets/common/error_image.dart';
import 'package:get_games/widgets/common/full_container.dart';
import 'package:get_games/widgets/common/get_button.dart';
import 'package:get_games/widgets/common/half_container.dart';
import 'package:get_games/widgets/free_games/column_text.dart';

class GameFreeIndexView extends StatelessWidget {
  const GameFreeIndexView({super.key, required this.freeGame});

  final FreeGamesModel freeGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Free",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.r,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: freeGame.image!,
              width: 1.sw,
              height: 225.h,
              errorWidget: (context, url, error) => const ErrorIcon(),
            ),
            Padding(
              padding: REdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      freeGame.title!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      HalfContainer(header: "Price", info: freeGame.worth!),
                      SizedBox(width: 30.w),
                      HalfContainer(header: "Type", info: freeGame.type!),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  FullContainer(header: "Platforms", info: freeGame.platforms),
                  SizedBox(height: 7.h),
                  ColumnText(title: "Description", data: freeGame.description!),
                  SizedBox(height: 7.h),
                  FullContainer(header: "End Date", info: freeGame.endDate),
                  SizedBox(height: 7.h),
                  ColumnText(
                    title: "Instructions",
                    data: freeGame.instructions!,
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: GetButton(
                      buttonText: "Get",
                      buttonFunction: () {},
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
