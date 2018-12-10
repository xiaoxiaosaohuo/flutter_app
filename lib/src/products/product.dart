import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;
  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }
  @override
  Widget build(BuildContext context) {
    // print(products);
    return ListView(
        children: products
            .map((element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/2.jpg", fit: BoxFit.cover),
                      Text(element)
                    ],
                  ),
                ))
            .toList());
  }
}
