import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../data/text_controller_attribute.dart';
import '../../../logic/account_crud_cubit.dart';

class TextFieldsGrid extends StatelessWidget {
  const TextFieldsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCrudCubit, AccountCrudState>(builder: (context, state) {
      List<TextControllerAttribute> controllers =
          context.read<AccountCrudCubit>().controllers;
      return Flexible(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controllers.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomInputField(
                      hintText: 'field name',
                      keyboardType: TextInputType.text,
                      controller: controllers[index].key,
                      onChange: (text) {
                        context
                            .read<AccountCrudCubit>()
                            .onTextFieldChanged(index, text);
                      },
                    ),
                  ),
                  horizontalSpace(20),
                  Expanded(
                    flex: 6,
                    child: CustomInputField(
                      hintText: 'field value',
                      keyboardType: TextInputType.emailAddress,
                      controller: controllers[index].value,
                      onChange: (text) {
                        context
                            .read<AccountCrudCubit>()
                            .onTextFieldChanged(index, text);
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          controllers[index].isSensitive
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          color: AppColors.lighterGrey,
                        ),
                        onPressed: () {
                          context.read<AccountCrudCubit>().markAsSensitive(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
