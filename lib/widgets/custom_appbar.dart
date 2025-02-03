import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? backImage;
  final double backImageSize;
  final TextStyle? titleStyle;
  final Widget? searchIcon;
  final Widget? filterIcon;
  final Function()? onBackPressed;
  final Function()? onSearchPressed;
  final Function()? onFilterPressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.backImage,
    this.backImageSize = 24.0,
    this.titleStyle,
    this.searchIcon,
    this.filterIcon,
    this.onBackPressed,
    this.onSearchPressed,
    this.onFilterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20), // Left & Right Padding
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: backImage != null
            ? GestureDetector(
                onTap: onBackPressed ??
                    () {
                      Navigator.pop(context);
                    },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: backImageSize,
                    height: backImageSize,
                    child: backImage,
                  ),
                ),
              )
            : null,
        title: title != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (backImage != null) const SizedBox(width: 8),
                  Text(
                    title!,
                    style: titleStyle ?? AppTextStyles.popBold17,
                  ),
                ],
              )
            : null, // Agar title null hai to title nahi dikhega
        actions: [
          if (searchIcon != null)
            GestureDetector(
              onTap: onSearchPressed ?? () {
                print("Search icon tapped");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: searchIcon!,
              ),
            ),
          if (filterIcon != null)
            GestureDetector(
              onTap: onFilterPressed ?? () {
                print("Filter icon tapped");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: filterIcon!,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
