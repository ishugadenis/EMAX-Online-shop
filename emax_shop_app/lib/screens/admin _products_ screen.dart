import 'package:emax_shop_app/screens/edit_product_screen.dart';
import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../widgets/admin_product_holder.dart';
import '../widgets/app_drawer.dart';

class AdminProducts extends StatefulWidget {
  const AdminProducts({Key? key}) : super(key: key);

  static const routeName = './admin_products_screen';

  @override
  State<AdminProducts> createState() => _AdminProductsState();
}

class _AdminProductsState extends State<AdminProducts> {
  Future<void> _refreshIndicator() async {
    await Provider.of<ProductList>(context, listen: false)
        .fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final prods = Provider.of<ProductList>(context).products;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: appBar_color,
        title: const Text("Manage Products"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshIndicator,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('<<<<<'),
                    Text(
                      'Swipe to remove product',
                    )
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: prods.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: prods[i],
                    child: Dismissible(
                        key: Key(prods[i].productId),
                        background: Container(
                          color: Colors.greenAccent,
                        ),
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Caution !'),
                                  content: const Text(
                                      'Are you sure you want to delete this item'),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: const Text('cancel')),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text('Delete'))
                                  ],
                                );
                              });
                        },
                        direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            Provider.of<ProductList>(context, listen: false)
                                .deleteProduct(prods[i].productId);
                          });
                        },
                        secondaryBackground: Container(
                          alignment: Alignment.centerRight,
                          // ignore: sort_child_properties_last
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                            ),
                          ),
                          color: Colors.redAccent,
                        ),
                        child: const AdminProductHolder())),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: btn_color,
        onPressed: () {
          Navigator.pushNamed(context, EditProductScreen.routeName);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
