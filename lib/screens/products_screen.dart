import 'package:flutter/material.dart';
import '../shared/consts.dart';
import '../widgets/category_holder.dart';

class ProductsScreeen extends StatelessWidget {
  const ProductsScreeen({Key? key}) : super(key: key);
  static const routeName = './products_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMAX',
            style: TextStyle(
                color: iconbtn_color, fontWeight: FontWeight.bold)),
        backgroundColor: container_color,
        actions: const [
          Icon(
            Icons.shopping_cart,
            size: 25,
            color: iconbtn_color,
          )
        ],
      ),
      body: const CategoryHolder(
      ),
      
      
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
