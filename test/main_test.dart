import 'package:test/test.dart';
import 'package:emax_shop_app/providers/cart_provider.dart';
void main() {
   test('Items should be added to cart', () {
      final cart = Cart();

      cart.addItem(
          'A1',
          2300.00,
          'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
          'Tv');
      if (cart.items.containsKey('A1')) {
        expect(cart.itemCount, cart.itemCount);
      } else {
        expect(cart.itemCount, 1);
      }
    });

    test('Cart should be cleared', () {
    final cart = Cart();
    cart.clear();
    expect(cart.itemCount, 0);
  });

}
