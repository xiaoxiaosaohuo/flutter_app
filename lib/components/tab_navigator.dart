import 'package:flutter/material.dart';
import 'package:flutter_app/components/bottom_navigation.dart';
import 'package:flutter_app/pages/color_detail_page.dart';
import 'package:flutter_app/pages/colors_list_page.dart';
import 'package:flutter_app/pages/input_page.dart';
class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
  static const String person = '/person';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => ColorsListPage(
            color: TabHelper.color(tabItem),
            title: TabHelper.description(tabItem),
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: TabHelper.color(tabItem),
            title: TabHelper.description(tabItem),
            materialIndex: materialIndex,
          ),
      TabNavigatorRoutes.person: (context) => InputPage(
            // color: TabHelper.color(tabItem),
            // title: TabHelper.description(tabItem),
            // materialIndex: materialIndex,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);
        
    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          print("得看数据地方11");
          print(routeSettings);
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        });
  }
}