import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/default_add_platform_text.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/add_platform_view_widgets/platform_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPlatformViewBody extends StatelessWidget {
  const AddPlatformViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController platformNameInputController = TextEditingController();

    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: AppColors.white),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Container(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const DefaultAddPlatformText(
                        mainText: "Add Platform",
                        subText: "Please fill the input below here",
                        iconPath: "assets/svgs/platforms.svg",
                      ),
                      verticalSpace(33),
                      CustomInputField(
                        controller: platformNameInputController,
                        hintText: 'Platform Name',
                        icon: Icons.person,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpace(33),
                      const PlatformColorPicker(),
                      verticalSpace(33),
                      CustomButton(
                          text: "Create",
                          onPressed: () {
                            print("create clicked");
                          })
                    ]),
              ),
            ),
          ),
        ),
    );
  }
}
