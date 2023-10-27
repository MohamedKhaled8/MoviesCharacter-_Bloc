import 'package:flutter/material.dart';
import 'package:bloclearn/core/constant/my_color.dart';

class CustomLoadingIndectaor extends StatelessWidget {
  const CustomLoadingIndectaor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }
}
