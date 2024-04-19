import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/core/widgets/keyboard_hider.dart';
import 'package:accounts_protector/features/accounts/ui/widgets/accounts_view/account_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/models/account.dart';
import '../../../logic/accounts_cubit.dart';

class AccountsGrid extends StatelessWidget {
  const AccountsGrid({super.key, required this.color});

  // late List<Account> accounts;
  final Color color;

  @override
  Widget build(BuildContext context) {
    List<Account> accounts = [];
    return Expanded(
      child: KeyboardHider(
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 5.h),
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<AccountsCubit, AccountsState>(
            builder: (context, state) {
              if(state is AccountSearchState){
                accounts = context.read<AccountsCubit>().filteredAccounts;
              }
              else {
                accounts = context.read<AccountsCubit>().selectedPlatform!.accounts!;
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
                            context.push(Routes.accountView.path);
                            context.read<AccountsCubit>().selectedAccount =
                                accounts[index];
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
      ),
    );
  }
}
