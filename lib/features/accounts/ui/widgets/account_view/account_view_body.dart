import 'package:accounts_protector/core/models/account.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/pair.dart';
import '../../../logic/accounts_cubit.dart';
import '../accounts_view/top_part.dart';
import 'attributes_grid.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(
      builder: (context, state) {
        final Account account = context.read<AccountsCubit>().selectedAccount!;
        final List<Pair<String, String>> selectedAccountAttributes =
        context.read<AccountsCubit>().getSelectedAccountAttributes();
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.h),
              child: TopPart(
                title: account.accountName ?? "",
                onPressed: () {
                  context.push(Routes.editAccountView.path);
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child:
                      AttributesGrid(attributes: selectedAccountAttributes),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
