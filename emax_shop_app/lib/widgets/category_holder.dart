import 'package:emax_shop_app/providers/category.dart';
import 'package:emax_shop_app/shared/consts.dart';
import 'package:emax_shop_app/widgets/product%20holder.dart';
import 'package:flutter/material.dart';
import '../widgets/product holder.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class CategoryHolder extends StatelessWidget {
  const CategoryHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cats = Provider.of<Categories>(context).cat;
    //final cat = Provider.of<Category>(context);
    final prods = Provider.of<ProductList>(context).products;

    return SingleChildScrollView(
      child: Column(
        children: cats
            .map(
              (e) => Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: cat_color,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(e.category),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                          value: prods.firstWhere((element) => element.category == e.category),
                           child: ProductHolder()),
                      itemCount: prods.where((element) => element.category == e.category).length,
                    ),
                  )
                ]),
              ),
            )
            .toList(),
      ),
    );
  }
}
