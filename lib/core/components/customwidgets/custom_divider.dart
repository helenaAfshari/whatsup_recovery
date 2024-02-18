
import 'package:flutter/material.dart';
import 'package:notif/core/resource/constants/my_colors.dart';

// ignore: must_be_immutable
class CustomDivider extends StatelessWidget {
double endIndent;
double indent;
CustomDivider({super.key, required this.endIndent,required this.indent});
  @override
  Widget build(BuildContext context) {
    return   Divider(
    endIndent: endIndent,
    indent: indent,
    color: MyColors.dividerColor,);
  }
}