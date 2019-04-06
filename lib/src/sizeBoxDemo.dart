import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';
class SizeBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
	  var deviceSize = MediaQuery.of(context).size;
	  print(deviceSize);
      return MaterialApp(
        title: "Demo Page",
        theme: ThemeData(primarySwatch: Colors.blue),
        home:Scaffold(
			appBar: new AppBar(
					title: const Text('Widget Demo'),
				),
			body: SafeArea(
				child:Center(
					child: Column(
					children: <Widget>[
						SizedBox(
							width: 100.0,
             	height: 100.0,
							child: RandomContainer(
								width: 50,
								height: 50,
							),
							),
						SizedBox(
						height: 20,
						),
						RandomContainer(
							child: SizedBox.fromSize(
								size: deviceSize / 10.0,
							),
						),
						RandomContainer(
							height: 200.0,
							width: 200.0,
							child: SizedBox.expand(
								child: FlutterLogo(
									size:100
								),
							),
						),
						RandomContainer(
							height: 100.0,
							width: 100.0,
							child: FractionallySizedBox(
								heightFactor: 0.5,
								widthFactor: 0.5,
								child: FlutterLogo(),
							),
						)
					],
				),
				)
				
			),
		)
      );
    }
}
