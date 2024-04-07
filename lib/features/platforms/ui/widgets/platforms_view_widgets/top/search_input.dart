import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../logic/platforms/platforms_cubit.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, this.onChanged});

  final VoidCallback? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: AppColors.lightPurple,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6).add(EdgeInsets.only(left: 8.h)),
          child: TextField(
            style: const TextStyle(
              color: AppColors.white,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyles.font15WhiteSemiBold,
              icon: const Icon(
                Icons.search,
                color: AppColors.white,
              ),
            ),
            onChanged: (value) {
              context.read<PlatformsCubit>().searchPlatform(value);
            },
          ),
        ),
      ),
    );
  }
}
