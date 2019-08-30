import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';


final List<DemoViewModal> demos = [
  DemoViewModal(
    title: 'basic_list',
    route: 'basic_list',
  ),
  DemoViewModal(
    title: 'sticky_list',
    route: 'sticky_list',
  ),
  DemoViewModal(
    title: 'customer_list',
    route: 'customer_list',
  ),
  DemoViewModal(
    title: 'filterMenu',
    route: 'filter_menu',
  ),
  DemoViewModal(
    title: 'nestList',
    route: 'nest_list',
  ),
  DemoViewModal(
    title: 'flightSearch',
    route: 'flight_search',
  ),
  
];

class DemoViewModal {
  final String title;
  final String route;

  DemoViewModal({this.title, this.route});
}

class HomePage extends StatelessWidget {

  onPressed(context,route,title){
    print(title);
    Application.router.navigateTo(context, '/$route?pageName=$title',);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver系列组件'),
      ),
      body: ListView.builder(
        itemCount: demos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onPressed: ()=> this.onPressed(context,demos[index].route,demos[index].title),
              child: Text(demos[index].title),
            ),
          );
        },
      ),
    );
  }
}