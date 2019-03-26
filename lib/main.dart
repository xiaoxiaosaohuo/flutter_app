import 'package:flutter/material.dart';
void main ()=>runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Login Page",
        theme: ThemeData(primarySwatch: Colors.blue),
        home:LoginPage()
      );
    }
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return LoginPageState();
    }
}

class  LoginPageState extends State<LoginPage>  with SingleTickerProviderStateMixin {
    Animation<double> _iconAnimation;
    AnimationController _iconAnimationController;
 

  
  @override
  void initState() {
      super.initState();
      _iconAnimationController = AnimationController(
        vsync: this,
        duration: Duration(microseconds: 500)
      );
      _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceOut,
      );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();

  }
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/girl.jpeg"),
              fit: BoxFit.cover,
              colorBlendMode:BlendMode.darken,
              color:Colors.black87
            ),
            Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.tealAccent,fontSize: 25.0)
                )
              ),
              isMaterialAppTheme: true,
              child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: _iconAnimation.value * 140.0),
                  Container(
					padding: const EdgeInsets.all(40.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:InputDecoration(
                              labelText: '输入邮箱',
                              fillColor: Colors.white,
                            ),
                             keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration:InputDecoration(
                              labelText: '输入密码',
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                             keyboardType: TextInputType.text,
                          ),
                          Padding(
                          	padding: const EdgeInsets.only(top: 60.0),
                     		),
							new MaterialButton(
								height: 50.0,
								minWidth: 150.0,
								color: Colors.green,
								splashColor: Colors.teal,
								textColor: Colors.white,
								child: Text("登录"),
								onPressed: () {},
							)
                        ],
                      ),
                    ),
                    )
                ],
              ),
            )
          ],
        )
      );
    }
}