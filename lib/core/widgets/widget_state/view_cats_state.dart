import 'package:cat_app/core/widgets/cats_widget.dart';
import 'package:cat_app/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewCats extends StatelessWidget {
  ViewCats({required this.cats});

  final List<Cat> cats;

  List<CatWidget> _buildList() {
    return cats.map((catData) => CatWidget(cat: catData)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: SingleChildScrollView(
        child: Column(
          children: _buildList(),
        ),
      ),
    );
  }
}