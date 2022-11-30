import 'package:emax_shop_app/screens/admin%20_products_%20screen.dart';
import 'package:emax_shop_app/screens/edit_product_screen.dart';

import './screens/specicfic_product_scree.dart';
import './screens/products_screen.dart';
import 'package:flutter/material.dart';
import './screens/authentication_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import './providers/product.dart';
import './providers/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
         value: ProductList(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
         )
      ],
      child: MaterialApp(
            title: 'EMAX ',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home:  //auth.isAuth ?
              const ProductsScreeen(),
          //: const AuthenticationScreen(),
            routes: {
             ProductsScreeen.routeName: (_) => const ProductsScreeen(),
            SpecificProductScreen.routeName: (_) =>
                const SpecificProductScreen(),
            AdminProducts.routeName: (_) => const AdminProducts(),
            EditProductScreen.routeName: (_) => EditProductScreen(),
            }
      ),
    );
  }
}
