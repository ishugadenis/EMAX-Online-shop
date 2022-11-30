import 'package:flutter/material.dart';

class CartItemHolder extends StatelessWidget {
  const CartItemHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        children: [
          Expanded(
            child: Row(children: [
              Image.network(
                'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Item: Vitron tv'),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.add),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('5'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.remove),
                        )
                      ],
                    ),
                    Text('Price: Ksh.35000')
                  ],
                ),
              ),
              const Icon(Icons.delete)
            ]),
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
