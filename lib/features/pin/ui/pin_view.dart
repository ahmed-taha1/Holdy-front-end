import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/spacing.dart';
import '../logic/pin_cubit.dart';
import '../logic/pin_state.dart';
import 'widgets/numbers_grid.dart';
import 'widgets/shared/circles.dart';
import 'widgets/shared/icon_with_top_text.dart';

class PinView extends StatelessWidget {
  final VoidCallback onSuccess;

  const PinView({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //     backGroundColor: Theme.of(context).scaffoldBackgroundColor),
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        minimum: EdgeInsets.only(top: 120.h),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(20),
                const IconWithTopText(
                  title: 'Enter your PIN',
                  addWarning: false,
                ),
                verticalSpace(20),
                BlocBuilder<PinCubit, PinState>(
                  builder: (context, state) {
                    return Circles(
                      numOfLightCircles:
                          context.read<PinCubit>().currentPinLength,
                    );
                  },
                ),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: NumbersGrid(
                    isCreatePin: false,
                  ),
                ),
                verticalSpace(20),
                BlocListener<PinCubit, PinState>(
                  listener: (context, state) {
                    if (state is PinSuccessState) {
                      onSuccess();
                    }
                    else if (state is PinFailureState) {
                      showSnackBar(context: context, message: state.errorMassage);
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
