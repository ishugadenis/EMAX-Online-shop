import 'package:emax_shop_app/shared/consts.dart';
import 'package:emax_shop_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class SpecificProductScreen extends StatelessWidget {
  const SpecificProductScreen({Key? key}) : super(key: key);

  static const routeName = './specificScreen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
    final prod = Provider.of<ProductList>(context).products.firstWhere(
          (element) => element.productId == routeArgs['id'],
        );
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: container_color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Image.network(
                prod.imageUrl,
                fit: BoxFit.scaleDown,
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: appBar_color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(prod.productName, style: hstyle),
                    Text('Price: Ksh${prod.price}', style: subHstyle),
                    Text(
                      prod.description,
                      style: subHstyle,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'ADD TO CART',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: btn_color,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
