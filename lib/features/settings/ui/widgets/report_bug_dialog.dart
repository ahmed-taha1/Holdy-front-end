import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../logic/settings_cubit.dart';

Future<void> displayReportBugDialog({required BuildContext context}) async {
  TextEditingController controller = TextEditingController();
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Report Bug'),
        content: TextFormField(
          controller: controller,
          decoration:
              const InputDecoration(hintText: "Please describe the bug here..."),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              context.pop();
            },
          ),
          TextButton(
            child: const Text('Send'),
            onPressed: () {
              String message = controller.text;
              context.read<SettingsCubit>().reportBug(message);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
