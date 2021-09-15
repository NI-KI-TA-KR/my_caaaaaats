import 'package:cat_app/bloc/cats_bloc.dart';
import 'package:cat_app/const.dart';
import 'package:cat_app/styles/cats_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyListOfCats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: EdgeInsets.fromLTRB(10.w, 30.w, 10.w, 10.w),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: SvgPicture.asset(
              CatsIcons.catsEmpty,
              height: 60.w,
              color: ThemesColor.black,
            ),
          ),
          Expanded(
            child: Text(
              "Oops, something went wrong. Check your internet connection and try again",
              style: TextStyle(
                  color: ThemesColor.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              context.read<CatsBloc>().add(CatsEvent.loading);
            },
            child: Container(
              margin: EdgeInsets.all(5.w),
              height: 10.w,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w),
                color: ThemesColor.pink,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.refresh,
                    color: ThemesColor.white,
                  ),
                  Text("Refresh",
                      style: TextStyle(
                          color: ThemesColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}