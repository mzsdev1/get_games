import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/free_games/free_games_api_controller.dart';
import 'package:get_games/views/free_games/free_games_list_view.dart';

class TypeDropdownButton extends StatelessWidget {
  const TypeDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => DropdownButton(
          value: ref.watch(selectedGameTypeProvider),
          onChanged: (value) {
            ref
                .read(selectedGameTypeProvider.notifier)
                .setSelectedGameType(value!);
          },
          items: gameTypes.map<DropdownMenuItem<String>>(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
              );
            },
          ).toList()),
    );
  }
}
