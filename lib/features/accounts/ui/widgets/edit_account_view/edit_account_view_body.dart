import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/keyboard_hider.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../platforms/logic/platforms/platforms_cubit.dart';
import '../../../logic/accounts_cubit.dart';
import '../add_account_view/text_fields_grid.dart';

class EditAccountViewBody extends StatelessWidget {
  const EditAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AccountsCubit>().accountNameController.text =
        context.read<AccountsCubit>().selectedAccount!.accountName!;
    context.read<AccountsCubit>().fillControllersWithSelectedAccountAttr(
        context.read<AccountsCubit>().selectedAccount!);
    return BlocListener<AccountsCubit, AccountsState>(
      listener: (context, state) {
        if (state is AccountDeletedState) {
          EasyLoading.dismiss();
          final numOfAccounts =
              context.read<AccountsCubit>().selectedPlatform!.numOfAccounts;
          final platformId =
              context.read<AccountsCubit>().selectedPlatform!.platformId!;
          context
              .read<PlatformsCubit>()
              .changePlatformNumOfAccounts(platformId, numOfAccounts);
          context.pop();
          context.pop();
        } else if (state is AccountLoadingState) {
          showCustomLoading();
        } else if (state is AccountUpdatedState) {
          EasyLoading.dismiss();
          context.pop();
        } else if (state is FailedState) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ViewHeader(
                mainText: 'Edit Your Account',
                iconPath: 'assets/svgs/account_icon.svg',
                vSpace: 10,
              ),
              CustomInputField(
                hintText: 'Account Name',
                icon: Icons.person,
                controller: context.read<AccountsCubit>().accountNameController,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(20),
              const TextFieldsGrid(),
              verticalSpace(40),
              CustomButton(
                text: 'Save',
                onPressed: () {
                  context.read<AccountsCubit>().updateAccount();
                },
              ),
              verticalSpace(20),
              CustomButton(
                text: 'Delete',
                onPressed: () {
                  context.read<AccountsCubit>().deleteAccount();
                },
                backgroundColor: Colors.redAccent,
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
