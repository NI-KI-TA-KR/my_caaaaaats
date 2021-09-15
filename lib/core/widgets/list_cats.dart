import 'package:cat_app/bloc/cats_bloc.dart';
import 'package:cat_app/const.dart';
import 'package:cat_app/core/widgets/widget_state/empty_list_state.dart';
import 'package:cat_app/core/widgets/widget_state/view_cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ListOfCats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatsBloc, CatsState>(builder: (context, catsState) {
      if (catsState is CatsStateLoading)
        return Container(
          margin: EdgeInsets.only(top: 70.w),
          child: CircularProgressIndicator(color: ThemesColor.pink),
        );

      if (catsState is CatsStateEmpty) {
        return EmptyListOfCats();
      }

      if (catsState is CatsStateLoaded) {
        final cats = catsState.cats;
        return ViewCats(cats: cats);
      }

      return Container();
    });
  }
}
