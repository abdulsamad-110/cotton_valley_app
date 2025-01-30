import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? backImage;
  final double backImageSize;
  final TextStyle? titleStyle;
  final Widget? searchIcon;
  final Widget? menuIcon;
  final Function()? onBackPressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.backImage,
    this.backImageSize = 24.0,
    this.titleStyle,
    this.searchIcon,
    this.menuIcon,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Left & Right Padding
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0, // Title ko left align rakhta hai
        leading: backImage != null
            ? GestureDetector(
                onTap: onBackPressed ?? () {
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
            : null, // Agar backImage null hai to leading bhi null hoga
        title: title != null
            ? Row(
                mainAxisSize: MainAxisSize.min, // Jitni zaroorat ho utni space lega
                children: [
                  if (backImage != null) const SizedBox(width: 8), // Gap if backImage exists
                  Text(
                    title!,
                    style: titleStyle ??
                        const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ],
              )
            : null, // Agar title null hai to title nahi dikhega
        actions: [
          if (searchIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: searchIcon!,
            ),
          if (menuIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: menuIcon!,
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
