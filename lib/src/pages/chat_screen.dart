import 'package:flutter/material.dart';
import '../models/chat_model.dart';


class ChatScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return ChatScreenState();
    }
}

class ChatScreenState extends State<ChatScreen>{
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return ListView.builder(
        itemCount:  dummyData.length,
        itemBuilder: (context,i)=>Column(
          children: <Widget>[
            Divider(height: 10,),
            ListTile(
              leading: CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage:NetworkImage(dummyData[i].avatarUrl)
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dummyData[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  Text(
                    dummyData[i].time,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0)
                  )

                ],
              ),
              subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child:  Text(
                    dummyData[i].message,
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
            )
          ],
        ),
      );
    }
}