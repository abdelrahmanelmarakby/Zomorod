import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resourses/color_manger.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final void Function(String)? onSubmitted;
  const SearchInput(
      {required this.textController,
      required this.hintText,
      this.onSubmitted,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: ColorsManager.primary,
        ),
        filled: true,
        fillColor: context.isDarkMode
            ? ColorsManager.charcoal
            : ColorsManager.offWhite,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
