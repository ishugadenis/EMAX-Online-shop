import 'package:emax_shop_app/screens/admin%20_products_%20screen.dart';
import 'package:emax_shop_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/products_screen.dart';
import '../shared/consts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: container_color,
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
        ),
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.1,
          child: const Icon(Icons.shopping_bag),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 1.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(ProductsScreeen.routeName);
          },
          child: const ListTile(
            leading: Text('Shop'),
            trailing: Icon(Icons.shop),
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          },
          child: const ListTile(
            leading: Text('Cart'),
            trailing: Icon(Icons.shopping_cart),
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
          child: const ListTile(
            leading: Text('Orders'),
            trailing: Icon(Icons.payment),
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AdminProducts.routeName);
          },
          child: const ListTile(
            leading: Text('Manage Products'),
            trailing: Icon(Icons.settings),
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const ListTile(
          leading: Text('Log out'),
          trailing: Icon(Icons.logout),
        ),
      ]),
    );
  }
}
