import 'package:accounts_protector/features/account/logic/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/widgets/spacing.dart';
import '../../platform/ui/widgets/platform_view/top_part.dart';
import 'widgets/account_view/attributes_grid.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBack(
        arrowColor: AppColors.white,
        backGroundColor: AppColors.purple,
      ),
      backgroundColor: AppColors.purple,

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                return TopPart(
                  title: context.read<AccountCubit>().account.accountName ?? "",
                  onPressed: () {
                    context.push(
                      Routes.pinView.path,
                      extra: () {
                        context.pushReplacement(
                          Routes.updateAccountView.path,
                          extra: context.read<AccountCubit>().account,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          verticalSpace(35),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    final attributes =
                        context.read<AccountCubit>().extractAccountAttributes();
                    return AttributesGrid(
                      attributes: attributes,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
