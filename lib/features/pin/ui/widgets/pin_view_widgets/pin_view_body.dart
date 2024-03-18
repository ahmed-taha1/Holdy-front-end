import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:accounts_protector/features/pin/ui/widgets/shared/circles.dart';
import 'package:accounts_protector/features/pin/ui/widgets/shared/icon_with_top_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../logic/pin_state.dart';
import '../numbers_grid.dart';

class PinViewBody extends StatelessWidget {
  const PinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinCubit, PinState>(
      listener: (context, state) {
        if (state is PinSuccessState) {
          // TODO check which is better
          // Navigator.of(context).pop();
          context.go(Routes.platformsView.path);
        }
        if (state is PinFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMassage),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          minimum: EdgeInsets.only(top: 120.h),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(20),
                  const IconWithTopText(
                      title: 'Enter your PIN', addWarning: false),
                  verticalSpace(20),
                  Circles(
                      numOfLightCircles:
                          context.read<PinCubit>().currentPinLength),
                  verticalSpace(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: NumbersGrid(
                      isCreatePin: false,
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
