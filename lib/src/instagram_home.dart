import 'package:flutter/material.dart';
import 'package:flutter_app/src/inst_body.dart';


class InstagramHome extends StatefulWidget {
  @override
  InstagramHomeState createState() => new InstagramHomeState();
}

class InstagramHomeState extends State<InstagramHome>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        leading: new Icon(Icons.camera_alt),
        title: SizedBox(
            height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.send),
          )
        ],
      ),
      body: Container(
        child: InstBody(),
      ),
      bottomNavigationBar:Container(
        color: Colors.white,
        height: 88.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home,
                  ),
                  iconSize:40,
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  iconSize:40,
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box,
                  ),
                  iconSize:40,
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  iconSize:40,
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                  ),
                  iconSize:40,
                  onPressed: null,
                ),
              ],
          ),
        ),
      )
      
    );
  }
}