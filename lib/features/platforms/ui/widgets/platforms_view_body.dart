import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/top_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottom_part.dart';

class PlatformsViewBody extends StatelessWidget {
  const PlatformsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.purple),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: PlatformsPageContainer(),
        ),
      ),
    );
  }
}

class PlatformsPageContainer extends StatelessWidget {
  const PlatformsPageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purple,
      child: Column(
        children: [
          TopPart(
            username: "Youssef",
          ),
          BottomPart()
        ],
      ),
    );
  }
}
