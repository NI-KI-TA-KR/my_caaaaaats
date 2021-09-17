import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/const.dart';
import 'package:cat_app/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class CatWidget extends StatelessWidget {
  CatWidget({required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      child: Column(
        children: [
          Stack(
            children: [
              if (cat.urlImage != null)
                CachedNetworkImage(
                  imageUrl: "${cat.urlImage}",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 40.w,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: ThemesColor.pink.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3.w),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (cat.urlImage == null)
                Container(
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: ThemesColor.pink.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(3.w),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.w),
                      child: SvgPicture.asset(
                        CatsIcons.catsImageEmpty,
                        color: ThemesColor.black,
                        height: 50.w,
                        width: 50.w,
                      ),
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 32.w, left: 3.w),
                child: Text(
                  "${cat.origin}",
                  style: TextStyle(
                      color: cat.urlImage != null
                          ? ThemesColor.pink
                          : ThemesColor.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                if (cat.wikipediaUrl != null && cat.wikipediaUrl != "")
                  launch("${cat.wikipediaUrl}");
              },
              child: Text(
                "Name's cat: ${cat.name}",
                style: TextStyle(
                    color: ThemesColor.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}