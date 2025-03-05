import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'app_bar_circular_container.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const
  RecipeAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.toolbarHeight = 72,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height =
    bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36,vertical: 10),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: SvgPicture.asset(
              "assets/icons/backarrow.svg",
              width: 30,
              height: 14,
              fit: BoxFit.none,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppBarCircularContainer(image: "assets/icons/notification.svg"),
                SizedBox(width: 8),
                AppBarCircularContainer(image: "assets/icons/search.svg"),
              ],
            ),
          ),
        ],
        bottom: bottom,
      ),
    );
  }
}
