import 'package:flutter/material.dart';

class IconCustom extends StatelessWidget {

  const IconCustom(
      {required this.iconData, required this.color, required this.onTap, required this.size});

  final IconData iconData;
  final Color color;
  final VoidCallback? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                iconData,
                color: onTap != null ? color : Colors.grey[400],
                size: size ?? 24,
              ),
            ),
          )
      ),
    );
  }
}
