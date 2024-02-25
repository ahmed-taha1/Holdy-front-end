import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class PlatformsGridItem extends StatelessWidget {
  PlatformsGridItem(
      {super.key, required this.cardClick, required this.platformName}) {
    platformInitial = platformName[0];
    // color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
    color = Colors.blue;
  }

  final VoidCallback cardClick;
  final String platformName;
  late final String platformInitial;
  late final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardClick,
      child: Card(
        elevation: 4,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: color),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Text(platformInitial,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 10,
              ),
              Text(platformName, style: TextStyles.font15BlackPurpleMedium),
              Text("0 Accounts", style: TextStyles.font11DarkGreyRegular),
            ],
          ),
        ),
      ),
    );
  }
}
