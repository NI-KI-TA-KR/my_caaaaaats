import 'package:cat_app/bloc/cats_bloc.dart';
import 'package:cat_app/const.dart';
import 'package:cat_app/core/widgets/app_bar.dart';
import 'package:cat_app/core/widgets/list_cats.dart';
import 'package:cat_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Cat App',  
        home: BlocProvider<CatsBloc>(
          create: (context) => CatsBloc()..add(CatsEvent.loading),
          child: MyHomePage(),)
      );
    });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CatAppBar(
              color: ThemesColor.pink,
              title: "My Caaaaaats",
              height: 40.w,
              textStyle: TextStyle(
                  color: ThemesColor.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            ListOfCats(),
          ],
        ),
      ),
    );
  }
}
