import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/spacing.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../data/pair.dart';
import '../../../logic/accounts_cubit.dart';

class TextFieldsGrid extends StatelessWidget {
  const TextFieldsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(builder: (context, state) {
      List<Pair> controllers = context.read<AccountsCubit>().controllers;
      return Flexible(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controllers.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomInputField(
                    hintText: 'field name',
                    keyboardType: TextInputType.text,
                    controller: controllers[index].key,
                    onChange: (text) {
                      context
                          .read<AccountsCubit>()
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
                          .read<AccountsCubit>()
                          .onTextFieldChanged(index, text);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
