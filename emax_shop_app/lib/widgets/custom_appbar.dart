import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBar_color,
      title:const Text('EMAX',
      style:
                TextStyle(color: iconbtn_color, fontWeight: FontWeight.bold)),
      actions: const [
          Icon(
            Icons.shopping_cart,
            size: 25,
            color: iconbtn_color,
          )
        ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}