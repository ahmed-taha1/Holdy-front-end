import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/top/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/styles.dart';

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd MMM, yyyy').format(DateTime.now());
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 30.h, bottom: 20.h, left: 40.w, right: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, $username", style: TextStyles.font17WhiteBold),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(date, style: TextStyles.font13WhiteRegular)
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context.push(Routes.settingsView.path);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          const SearchInput(),
        ],
      ),
    );
  }
}
