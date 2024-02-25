import 'package:accounts_protector/features/platforms/ui/widgets/search_input.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class TopPart extends StatelessWidget {
  TopPart({
    super.key,
    required this.username,
  }) {
    // to be moved for SRP
    var MONTHS = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    DateTime now = DateTime.now();
    date = "${now.day} ${MONTHS[now.month - 1]}, ${now.year}";
  }

  final String username;
  late final String date;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 20, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, $username", style: TextStyles.font17WhiteBold),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(date, style: TextStyles.font13WhiteRegular)
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        print("settings clicked");
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            const SearchInput()
          ],
        ));
  }
}
