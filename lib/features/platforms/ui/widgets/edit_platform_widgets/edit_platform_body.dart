import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/accounts/logic/accounts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../logic/platforms/platforms_cubit.dart';
import '../add_platform_view_widgets/platform_color_picker.dart';

class EditPlatformViewBody extends StatelessWidget {
  const EditPlatformViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController platformNameInputController = TextEditingController();
    platformNameInputController.text =
        context.read<AccountsCubit>().selectedPlatform!.platformName!;
    context.read<PlatformsCubit>().selectedColor = Color(
      int.parse(context.read<AccountsCubit>().selectedPlatform!.iconColor!,
          radix: 16),
    );
    return BlocListener<PlatformsCubit, PlatformsState>(
      listener: (context, state) {
        if (state is PlatformUpdateSuccess) {
          EasyLoading.dismiss();
          context.read<AccountsCubit>().updatePlatform();
          context.pop();
        } else if (state is PlatformDeleteFailure) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is PlatformLoadingState) {
          showCustomLoading();
        } else if (state is PlatformUpdateFailure) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is PlatformDeleteSuccess) {
          EasyLoading.dismiss();
          context.pop();
          context.pop();
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 42.w),
          child: Column(
            children: [
              const ViewHeader(
                mainText: 'Edit Your Platform',
                iconPath: "assets/svgs/platforms.svg",
              ),
              verticalSpace(33),
              CustomInputField(
                controller: platformNameInputController,
                hintText: 'Platform Name',
                icon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(20),
              const PlatformColorPicker(),
              verticalSpace(33),
              Column(
                children: [
                  CustomButton(
                    text: 'Save',
                    onPressed: () {
                      context.read<PlatformsCubit>().updatePlatform(
                            context
                                .read<AccountsCubit>()
                                .selectedPlatform!
                                .platformId!,
                            platformNameInputController.text,
                          );
                    },
                  ),
                  verticalSpace(20),
                  CustomButton(
                    text: 'Delete',
                    onPressed: () {
                      context.read<PlatformsCubit>().deletePlatform(context
                          .read<AccountsCubit>()
                          .selectedPlatform!
                          .platformId!);
                    },
                    backgroundColor: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
