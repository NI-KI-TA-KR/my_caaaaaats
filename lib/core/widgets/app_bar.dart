import 'package:cat_app/const.dart';
import 'package:cat_app/styles/cats_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CatAppBar extends StatelessWidget{
  CatAppBar({required this.color, required this.title, this.height, this.textStyle});

  final Color color;
  final String title; 
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height ?? 10.h,
      color: this.color,
      child: Container(
        margin: EdgeInsets.only(top: 10.w, left: 10.w),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 4.w),
              child: SvgPicture.asset(CatsIcons.logo, color: ThemesColor.white),
            ),
            Text(title, style: textStyle ?? TextStyle(color: ThemesColor.white))
          ],
        ),
      ),
    );
  }
}