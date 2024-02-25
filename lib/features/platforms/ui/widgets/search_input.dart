import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: const Color.fromARGB(255, 176, 171, 255)),
        child: Padding(
          padding: const EdgeInsets.all(6).add(const EdgeInsets.only(left: 8)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                icon: Icon(
                  Icons.search,
                  color: AppColors.blackPurple,
                )),
          ),
        ),
      ),
    );
  }
}
