import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;
  Products(this.products) {
    print('[Products Widget] Constructor:${this.products}');
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
