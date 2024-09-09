import 'package:accounts_protector/core/widgets/custom_app_app_bar_with_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import '../logic/account_crud_cubit.dart';
import 'widgets/create_account_view/password_slider.dart';
import 'widgets/create_account_view/text_fields_grid.dart';
import 'widgets/update_account_view/update_account_view_bloc_listener.dart';

class UpdateAccountView extends StatelessWidget {
  const UpdateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AccountCrudCubit>().fillControllers();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
          onPressed: () async{
            int passwordLen = await showSliderDialog(context);
            if (passwordLen != -1 && context.mounted) {
              context.read<AccountCrudCubit>().createRandomPassword(passwordLen);
            }
          },
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                controller: context.read<AccountCrudCubit>().accountNameController,
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
                text: 'Save',
                onPressed: () {
                  context.read<AccountCrudCubit>().updateAccount();
                },
              ),
              verticalSpace(20),
              CustomButton(
                text: 'Delete',
                onPressed: () {
                  context.read<AccountCrudCubit>().deleteAccount();
                },
                backgroundColor: Colors.redAccent,
              ),
              verticalSpace(20),
              const UpdateAccountViewBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
