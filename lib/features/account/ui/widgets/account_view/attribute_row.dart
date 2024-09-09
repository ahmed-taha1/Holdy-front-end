import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/account_attribute_for_ui.dart';
import '../../../logic/account_cubit.dart';

class AttributeRow extends StatelessWidget {
  final AccountAttributeForUi attribute;

  const AttributeRow({super.key, required this.attribute});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<AccountCubit, AccountState>(
        buildWhen: (previous, current) => current is ShowAttributeState,
        builder: (context, state) {
          bool isHidden = attribute.isHidden;
          if (state is ShowAttributeState &&
              state.attribute.key == attribute.key) {
            isHidden = state.attribute.isHidden;
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 280.w,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${attribute.key} : ",
                        style: TextStyles.font15BlackPurpleSemiBold.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: isHidden ? "*************" : attribute.value,
                        style: TextStyles.font15BlackPurpleMedium.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: isHidden
                    ? const Icon(Icons.visibility_off, size: 25)
                    : const Icon(Icons.copy_all_rounded, size: 25),
                onPressed: () {
                  if (isHidden) {
                    context
                        .read<AccountCubit>()
                        .showAttribute(attribute, context);
                  } else {
                    FlutterClipboard.copy(attribute.value);
                  }
                },
                color: Theme.of(context).primaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
