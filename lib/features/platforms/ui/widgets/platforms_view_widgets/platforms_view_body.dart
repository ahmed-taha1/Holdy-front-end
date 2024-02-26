import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/top/top_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottom/bottom_part.dart';

class PlatformsViewBody extends StatelessWidget {
  const PlatformsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.purple),
      child: SafeArea(
        child: Container(
          color: AppColors.purple,
          child: const Column(
            children: [
              TopPart(
                username: "Youssef",
              ),
              BottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
