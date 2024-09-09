import 'package:accounts_protector/core/widgets/custom_app_bar.dart';
import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:accounts_protector/features/pin/ui/widgets/numbers_grid.dart';
import 'package:accounts_protector/features/pin/ui/widgets/shared/circles.dart';
import 'package:accounts_protector/features/pin/ui/widgets/shared/icon_with_top_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/spacing.dart';
import '../logic/create_pin_cubit.dart';
import '../logic/pin_state.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: BlocListener<CreatePinCubit, PinState>(
        listener: (context, state) {
          if (state is PinFailureState) {
            showSnackBar(context: context, message: state.errorMassage);
          }
        },
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(20),
                  BlocBuilder<CreatePinCubit, PinState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          IconWithTopText(
                            title: context.read<CreatePinCubit>().isReenter
                                ? 'Re-Enter your PIN'
                                : 'Create your PIN',
                            addWarning: true,
                          ),
                          verticalSpace(20),
                          Circles(
                            numOfLightCircles:
                                context.read<CreatePinCubit>().currentPinLength,
                          ),
                        ],
                      );
                    },
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: NumbersGrid(),
                  ),
                  verticalSpace(20),
                  Text(
                    'Tip: use 6 unforgettable numbers\n'
                    'ex: first 6 numbers of your phone number,\n'
                    'first 6 numbers of your id,\n'
                    'your birth date',
                    style:
                        TextStyles.font11LightGreyBold.copyWith(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
