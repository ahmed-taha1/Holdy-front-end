import 'package:accounts_protector/features/accounts/logic/accounts_cubit.dart';
import 'package:accounts_protector/features/accounts/ui/widgets/accounts_view/bottom_part.dart';
import 'package:accounts_protector/features/accounts/ui/widgets/accounts_view/top_part.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/top/search_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/models/platform.dart';
import '../../../../../core/routing/routes.dart';

class AccountsViewBody extends StatelessWidget {
  const AccountsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(
      builder: (context, state) {
        Platform platform = context.read<AccountsCubit>().selectedPlatform!;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.h),
              child: TopPart(
                title: platform.platformName ?? "",
                onPressed: (){
                  context.push(Routes.editPlatformView.path);
                },
              ),
            ),
            verticalSpace(35),
            const SearchInput(),
            verticalSpace(40),
            BottomPart(
              platform: platform,
            ),
          ],
        );
      },
    );
  }
}
