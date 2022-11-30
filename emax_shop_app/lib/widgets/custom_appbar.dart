import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart';
import 'badge.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBar_color,
      title: const Text('EMAX',
          style: TextStyle(color: iconbtn_color, fontWeight: FontWeight.bold)),
      actions: [
        Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            child: ch!,
            color: btn_color,
            value: cart.itemCount.toString(),
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
