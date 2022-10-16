import 'package:emax_shop_app/providers/category.dart';
import 'package:emax_shop_app/shared/consts.dart';
import 'package:emax_shop_app/widgets/product%20holder.dart';
import 'package:flutter/material.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class CategoryHolder extends StatelessWidget {
  //const CategoryHolder({Key? key}) : super(key: key);
  // Category category;
  // CategoryHolder({required this.category});

  @override
  Widget build(BuildContext context) {
    //final prod = Provider.of<Product>(context);
    //final cat = Provider.of<Category>(context);
    final prod = Provider.of<ProductList>(context).products;
    return 
        Container(
          width:MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: prod[i],
                child: ProductHolder(
                  product: prod[i],
                )),
            itemCount: prod.length,
          ),
      
      );
  }
}
