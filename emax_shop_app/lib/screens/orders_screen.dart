import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: appBar_color,
        statusBarIconBrightness: Brightness.dark));
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body:ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i)
          =>OrderItem(
            orderData.orders[i]
          )),

    );
  }
}
