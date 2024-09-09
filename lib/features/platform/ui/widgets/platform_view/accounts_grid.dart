import 'package:accounts_protector/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/platform_cubit.dart';
import 'account_grid_item.dart';

class AccountsGrid extends StatelessWidget {
  const AccountsGrid({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // child: KeyboardHider(
        child: Padding(
          // clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 5.h),
          child: BlocBuilder<PlatformCubit, PlatformState>(
            builder: (context, state) {
              var accounts = context.read<PlatformCubit>().platform.accounts!;
              if(state is SearchPlatformState){
                accounts = state.accounts;
              }
              return ListView.builder(
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                // physics: const BouncingScrollPhysics(),
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: 25.h, left: 5.w, right: 5.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: AccountGridItem(
                          onPressed: () {
                            context.push(Routes.accountView.path, extra: accounts[index]);
                            // context.read<AccountsCubit>().selectedAccount =
                            //     accounts[index];
                          },
                          color: color,
                          accountName: accounts[index].accountName!,
                        ),
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
              );
            },
          ),
        ),
      // ),
    );
  }
}
