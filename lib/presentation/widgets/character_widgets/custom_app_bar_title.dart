import 'package:flutter/material.dart';
import 'package:bloclearn/core/constant/my_color.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
}
