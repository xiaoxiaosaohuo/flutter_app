import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './product.dart';

class ProductsManager extends StatefulWidget {
  final String initialProduct;
  ProductsManager({this.initialProduct}) {
    print('[ProductsManager Widget] Constructor');
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('[ProductsManager Widget] createState');
    return new ProductsManagerState();
  }
}

class ProductsManagerState extends State<ProductsManager> {
  List<String> _products = [];
  @override
  void initState() {
    _products.add(widget.initialProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductsManager oldWidget) {
    print(1);
    print(widget.initialProduct);
    super.didUpdateWidget(oldWidget);
    // setState(() {
    //      _products.map((index))
    //     });
  }

  _addCard() {
    print("222");
    setState(() {
      _products.add(WordPair.random().asCamelCase);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text('Add Card2'),
          color: Theme.of(context).primaryColor,
          onPressed: _addCard,
        ),
        alignment: Alignment.center,
      ),
      Expanded(child: new Products(_products))
    ]);
  }
}
