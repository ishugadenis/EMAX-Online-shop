import '../widgets/app_drawer.dart';
import '../widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/category_holder.dart';

class ProductsScreeen extends StatelessWidget {
  const ProductsScreeen({Key? key}) : super(key: key);
  static const routeName = './products_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      appBar: CustomAppBar(),
      body:  CategoryHolder(),

      // Center(
      //     child: RaisedButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(SpecificProductScreen.routeName);
      //   },
      //   child: Text('Specific prod screen'),
      // )),
    );
  }
}
