import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter_app/routers/application.dart';

import 'package:flutter_app/widgets/grid/grid_data.dart';
RandomColor _randomColor = RandomColor();

class ColorGrids extends StatelessWidget {

  Widget renderHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Text(
          'Chart',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
    );
  }

  Widget renderItem({context,data,color}){
      return  GestureDetector(
              onTap: ()=>Application.router.navigateTo(context, '/${data.link}?pageName=${data.title}',),
              child:Container(
                // color: color,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:color,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 4,
                      color: Color.fromARGB(20, 0, 0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              )
          );
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: barListData.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
       
        return this.renderItem(context:context,data: barListData[index],color: _randomColor.randomColor());
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          this.renderHeader(),
          this.renderBody(),
          
        ],
      )
    );
  }
}



class GridViewModel{
  final String title;
  final String link;

  const GridViewModel(
    {
      this.title,
      this.link
    }
  );
}