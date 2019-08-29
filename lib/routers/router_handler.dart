import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/animation_page.dart';
import 'package:flutter_app/pages/bar_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/animate_route_page.dart';
import 'package:flutter_app/pages/animate_card_page.dart';
import 'package:flutter_app/widgets/sliver_list/basic_list.dart';
import 'package:flutter_app/widgets/sliver_list/customer_list.dart';
import 'package:flutter_app/widgets/sliver_list/sticky_list.dart';
import 'package:flutter_app/widgets/fliter_menu/fliter_menu_page.dart';
import 'package:flutter_app/widgets/sliver_list/nest_list.dart';
// app的首页
Handler mainHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage ();
  },
);

Handler loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new LoginPage();
  },
);

Handler animationHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new AnimationPage();
  },
);

Handler barPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    String pageName = params['pageName']?.first;
    return new BarPage(name:pageName);
  },
);

Handler animateRoutePageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    String pageName = params['pageName']?.first;
    return new AnimateRoutePage(name:pageName);
  },
);
Handler animateCardPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    String pageName = params['pageName']?.first;
    return AnimateCardPage(name:pageName);
  },
);

Handler basicListPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    String pageName = params['pageName']?.first;
    return BasicList(title:pageName);
  },
);

Handler stickyListPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    String pageName = params['pageName']?.first;
    return StickyList(title:pageName);
  },
);

Handler customerListPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    // String pageName = params['pageName']?.first;
    return CustomSliverList();
  },
);

Handler nestListPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    // String pageName = params['pageName']?.first;
    return FlutterNestedScrollView();
  },
);


Handler fliterMenuPagePageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    // String pageName = params['pageName']?.first;
    return FliterMenuPage();
  },
);

