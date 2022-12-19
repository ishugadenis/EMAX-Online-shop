import 'package:emax_shop_app/providers/category.dart';
import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/material.dart';
import 'product_holder.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class CategoryHolder extends StatefulWidget {
  const CategoryHolder({Key key}) : super(key: key);

  @override
  State<CategoryHolder> createState() => _CategoryHolderState();
}

class _CategoryHolderState extends State<CategoryHolder> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductList>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: btn_color,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      e.category,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) =>
                                ChangeNotifierProvider.value(
                                    value: prods
                                        .where((element) =>
                                            element.category == e.category)
                                        .toList()[i],
                                    child: const ProductHolder()),
                            itemCount: prods
                                .where(
                                    (element) => element.category == e.category)
                                .length,
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
