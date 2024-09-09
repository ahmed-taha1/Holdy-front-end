import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import '../logic/platform_crud_cubit.dart';
import 'widgets/common/platform_color_picker.dart';
import 'widgets/create_platform/create_platform_view_bloc_listener.dart';

class CreatePlatformView extends StatelessWidget {
  const CreatePlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ViewHeader(
                    mainText: "Add Platform",
                    subText: "Please fill the input below here",
                    iconPath: "assets/svgs/platforms.svg",
                  ),
                  verticalSpace(33),
                  CustomInputField(
                    controller: context
                        .read<PlatformCrudCubit>()
                        .platformNameController,
                    hintText: 'Platform Name',
                    icon: Icons.person,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpace(33),
                  PlatformColorPicker(
                    onColorChanged: (Color color) {
                      context.read<PlatformCrudCubit>().selectedColor =
                          color;
                    },
                  ),
                  verticalSpace(33),
                  CustomButton(
                    text: "Create",
                    onPressed: () {
                      context.read<PlatformCrudCubit>().createPlatform();
                    },
                  ),
                  verticalSpace(40),
                  const CreatePlatformViewBlocListener(),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}