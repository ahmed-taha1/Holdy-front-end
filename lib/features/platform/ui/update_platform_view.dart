import 'package:accounts_protector/features/platform/logic/platform_crud_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import 'widgets/common/platform_color_picker.dart';
import 'widgets/update_platform/update_platform_view_listener.dart';

class UpdatePlatformView extends StatelessWidget {
  const UpdatePlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 42.w),
          child: Column(
            children: [
              const ViewHeader(
                mainText: 'Update Your Platform',
                iconPath: "assets/svgs/platforms.svg",
              ),
              verticalSpace(33),
              CustomInputField(
                controller:
                    context.read<PlatformCrudCubit>().platformNameController,
                hintText: 'Platform Name',
                icon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(20),
              PlatformColorPicker(
                onColorChanged: (color) {
                  context.read<PlatformCrudCubit>().selectedColor = color;
                },
              ),
              verticalSpace(33),
              Column(
                children: [
                  CustomButton(
                    text: 'Save',
                    onPressed: () {
                      context.read<PlatformCrudCubit>().updatePlatform();
                    },
                  ),
                  verticalSpace(20),
                  CustomButton(
                    text: 'Delete',
                    onPressed: () {
                      context.read<PlatformCrudCubit>().deletePlatform();
                    },
                    backgroundColor: Colors.redAccent,
                  ),
                ],
              ),
              const UpdatePlatformViewListener(),
            ],
          ),
        ),
      ),
    );
  }
}
