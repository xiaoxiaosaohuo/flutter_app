import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/fliter_menu/diagonal_clipper.dart';
import 'package:flutter_app/widgets/fliter_menu/initial_task.dart';
import 'package:flutter_app/widgets/fliter_menu/task_row.dart';
import 'package:flutter_app/widgets/fliter_menu/list_model.dart';
import 'package:flutter_app/widgets/fliter_menu/animate_fab.dart';

class FliterMenuPage extends StatefulWidget {

 @override
 _FliterMenuPageState createState() => _FliterMenuPageState();
}

class _FliterMenuPageState extends State<FliterMenuPage> {

  double _imageHeight = 256.0;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel listModel;

  bool showOnlyCompleted = false;

  @override
  void initState() {
    super.initState();
    listModel =  ListModel(_listKey, tasks);
  }
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Menu'),
      ),
      body: Stack(
        children: <Widget>[
          _buildTimeline(),
          buildImage(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
          _buildFab()
        ]
      ),
    );
  }

  Widget buildImage(){
    return ClipPath(
      clipper: DialogonalClipper(),
      child:Image.asset(
        'assets/images/italy01.jpg',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
        color: Color.fromARGB(120, 20, 10, 40),
      )
    ) ;
  }

  Widget _buildTopHeader (){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu,size: 32.0,color:Colors.white,),
           Expanded(
          child:  Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child:  Text(
              "Timeline",
              style:  TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
         Icon(Icons.linear_scale, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildProfileRow(){
    return Padding(
      padding: EdgeInsets.only(left: 16.0,top: _imageHeight / 2.5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            backgroundImage:  AssetImage('assets/images/1.jpg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Ryan Barnes',
                  style:  TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Product designer',
                  style:  TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildBottomPart() {
    return  Padding(
      padding:  EdgeInsets.only(top: _imageHeight),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTasksList(),
        ],
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return  Padding(
      padding:  EdgeInsets.only(left: 64.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text(
            'My Tasks',
            style:  TextStyle(fontSize: 34.0),
          ),
           Text(
            'FEBRUARY 8, 2015',
            style:  TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }


  // Widget _buildTasksList() {
  //   return  Expanded(
  //     child:  ListView(
  //       children: tasks.map((task) =>  TaskRow(task: task)).toList(),
  //     ),
  //   );
  // }
  Widget _buildTasksList() {
    return  Expanded(
      child:  AnimatedList(
        initialItemCount: tasks.length,
        key: _listKey,
        itemBuilder: (context, index, animation) {
          return  TaskRow(
            task: listModel[index],
            animation: animation,
          );
        },
      ),
    );
  }

    Widget _buildTimeline() {
      return  Positioned(
        top: 0.0,
        bottom: 0.0,
        left: 32.0,
        child:  Container(
          width: 1.0,
          color: Colors.grey[300],
        ),
      );
    }

    Widget _buildFab() {
    return  Positioned(
      top: _imageHeight - 100.0,
      right: -40.0,
      child:  AnimatedFab(
        onClick: _changeFilterState,
      ),
    );
  }

  void _changeFilterState() {
    showOnlyCompleted = !showOnlyCompleted;
    tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
    });
  }

}