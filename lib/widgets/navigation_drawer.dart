import 'package:app_builder/model/app_config.dart';
import 'package:app_builder/provider/app_config_provider.dart';
import 'package:app_builder/screens/posts_screen.dart';
import 'package:app_builder/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NavigationDrawer extends StatelessWidget {
  AppConfigProvider? appConfigProvider;
  List<MenuItem>? menuItems;

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of(context, listen: false);
    menuItems = appConfigProvider!.appConfig!.menuItems;

    return Drawer(
      child: Material(
        color: appConfigProvider!.getMenuBackgroundColor(),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 40),
          itemCount: menuItems!.length,
          itemBuilder: (BuildContext context, int index){
          return getNavigationMenuTile(context, menuItems![index], index);
        },),
      ),
    );
  }

  Widget getNavigationMenuTile(BuildContext context, MenuItem menuItem, int index){
    return Container(
      color: index ==  appConfigProvider!.selectedNavigationItem ?
      appConfigProvider!.getMenuItemSelectedBackgroundColor() : appConfigProvider!.getMenuItemBackgroundColor(),
      child: ListTile(
        leading: Icon(Icons.double_arrow_rounded),
        title: Text(menuItem.title ?? "Navigation Item", style: TextStyle(color: appConfigProvider!.getTextColor())),
        onTap:() => navigateToScreen(context, menuItem, index)
      ),
    );
  }

  void navigateToScreen(BuildContext context, MenuItem menuItem, int index){
    if(appConfigProvider!.selectedNavigationItem == index){ // If same page pop only
      Navigator.of(context).pop();
    }else{
      Navigator.of(context).pop();
      appConfigProvider!.selectedNavigationItem = index;
      if(menuItem.component == "posts"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return PostsScreen(menuItem: menuItem);
        }));
      }else if (menuItem.component == "external-page"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return WebViewScreen(menuItem: menuItem);
        }));
      }
    }
  }
}
