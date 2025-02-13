// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomPopupMenu extends StatelessWidget {
//   final VoidCallback? onEdit;
//   final VoidCallback? onDelete;
//  // final String iconPath;
//   final double iconSize;

//   const CustomPopupMenu({
//     Key? key,
//    // required this.iconPath,
//     this.onEdit,
//     this.onDelete,
//     this.iconSize = 22.0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       // icon: SvgPicture.asset(
//       //  // iconPath,
//       //  // height: iconSize,
//       //  // width: iconSize,
//       // ),
//       onSelected: (value) {
//         if (value == 'edit' && onEdit != null) {
//           onEdit!();
//         } else if (value == 'delete' && onDelete != null) {
//           onDelete!();
//         }
//       },
//       itemBuilder: (context) => [
//         const PopupMenuItem(
//           value: 'edit',
//           child: Text('Edit'),
//         ),
//         const PopupMenuItem(
//           value: 'delete',
//           child: Text('Delete'),
//         ),
//       ],
//     );
//   }
// }
