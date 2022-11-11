import 'package:emax_shop_app/screens/edit_product_screen.dart';
import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../widgets/admin_product_holder.dart';

class AdminProducts extends StatelessWidget {
  const AdminProducts({Key? key}) : super(key: key);

  static const routeName = './admin_products_screen';

  @override
  Widget build(BuildContext context) {
    final prods = Provider.of<ProductList>(context).products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar_color,
        title: const Text("Manage Products"),
      ),
      body: ListView.builder(
        itemCount: prods.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: prods[i], child: const AdminProductHolder()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EditProductScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
