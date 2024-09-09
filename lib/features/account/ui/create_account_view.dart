import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:accounts_protector/features/account/ui/widgets/create_account_view/password_slider.dart';
import 'package:accounts_protector/features/account/ui/widgets/create_account_view/text_fields_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import '../logic/account_crud_cubit.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
        action: IconButton(
          icon: Icon(
            Icons.key_rounded,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () async {
            int passwordLen = await showSliderDialog(context);
            if (passwordLen != -1 && context.mounted) {
              context
                  .read<AccountCrudCubit>()
                  .createRandomPassword(passwordLen);
            }
          },
        ),
      ),
      body: SafeArea(
        child: BlocListener<AccountCrudCubit, AccountCrudState>(
          listener: (context, state) {
            if (state is CreateAccountSuccess) {
              EasyLoading.dismiss();
              context.pop();
            } else if (state is AccountLoadingState) {
              showCustomLoading();
            } else if (state is FailedState) {
              EasyLoading.dismiss();
              showSnackBar(context: context, message: state.errorMessage);
            }
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: const ViewHeader(
                    mainText: 'Create Account',
                    subText:
                        'Please enter the account data\nthat you want to save,\nand Mark sensitive fields.',
                    iconPath: 'assets/svgs/account_icon.svg',
                    vSpace: 10,
                  ),
                ),
                verticalSpace(40),
                CustomInputField(
                  icon: Icons.person,
                  hintText: 'AccountName',
                  controller:
                      context.read<AccountCrudCubit>().accountNameController,
                  keyboardType: TextInputType.text,
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'is sensitive',
                      style: TextStyles.font15DarkGreySemiBold.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ],
                ),
                const TextFieldsGrid(),
                verticalSpace(40),
                CustomButton(
                  text: 'CREATE',
                  onPressed: () {
                    context.read<AccountCrudCubit>().createAccount();
                  },
                ),
                verticalSpace(40),
                Text(
                  'Field name ex:\n"Password", "Email", "User Name".',
                  style: TextStyles.font15DarkGreySemiBold.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
