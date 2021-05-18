import 'package:cardeno_de_oracao/screens/home/components/icon_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class IconDescription extends StatelessWidget {

  const IconDescription({required this.iconData, required this.title, required this.callback});

  final String title;
  final IconData iconData;
  final Callback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          IconCustom(
            iconData: iconData,
            color: Colors.black54,
            onTap: (){},
            size: 24,
          ),
          Text("$title")
        ],
      ),
    );
  }
}
