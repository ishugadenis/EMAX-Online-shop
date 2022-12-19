// ignore_for_file: missing_required_param, unnecessary_null_comparison

import 'package:emax_shop_app/providers/cart_provider.dart';
import 'package:emax_shop_app/screens/admin%20_products_%20screen.dart';
import 'package:emax_shop_app/screens/edit_product_screen.dart';
import './screens/specicfic_product_screen.dart';
import './screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import './providers/product.dart';
import './providers/category.dart';
import 'providers/orders.dart';
import 'screens/authentication_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          //create: (_) =>ProductList(),
          update: (ctx, auth, previousProducts) => ProductList(auth.token,
              previousProducts == null ? [] : previousProducts.products),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'EMAX ',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: auth.isAuth
                ? const ProductsScreeen()
                : const AuthenticationScreen(),
            routes: {
              ProductsScreeen.routeName: (_) => const ProductsScreeen(),
              SpecificProductScreen.routeName: (_) =>
                  const SpecificProductScreen(),
              AdminProducts.routeName: (_) => const AdminProducts(),
              EditProductScreen.routeName: (_) => const EditProductScreen(),
              CartScreen.routeName: (_) => const CartScreen(),
              OrdersScreen.routeName: (_) => const OrdersScreen(),
            }),
      ),
    );
  }
}
