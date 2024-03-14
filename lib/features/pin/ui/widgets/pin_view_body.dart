import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:accounts_protector/features/pin/ui/widgets/circles.dart';
import 'package:accounts_protector/features/pin/ui/widgets/icon_with_top_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bottom_text.dart';
import 'numbers_grid.dart';

class PinViewBody extends StatelessWidget {
  const PinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinCubit, PinState>(
      listener: (context, state) {
        if (state is PinFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMassage),
            duration: const Duration(seconds: 2),
          ));
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(20),
                IconWithTopText(
                    title: context.read<PinCubit>().isReenter ? 'Re-Enter your PIN' : 'Create your PIN', addWarning: true),
                verticalSpace(20),
                Circles(numOfLightCircles: context.read<PinCubit>().currentPinLength),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: NumbersGrid(),
                ),
                verticalSpace(20),
                const BottomText(),
              ],
            ),
          ),
        );
      },
    );
  }
}
