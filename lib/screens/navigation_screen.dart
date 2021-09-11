import 'package:app_builder/provider/app_config_provider.dart';
import 'package:app_builder/widgets/base_appbar.dart';
import 'package:app_builder/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
      builder: (context, value, Widget? child) {
        if (value.appConfig == null) {
          return Scaffold(body: Container());
        } else {
          return Scaffold(
            backgroundColor: value.getPageBackgroundColor(),
            drawer: NavigationDrawer(),
            appBar: BaseAppBar(title: "Objects Task"),
            body: Center(
              child: Text(
                "Please Choose Screen From Side Menu",
                style: TextStyle(color: value.getTextColor(), fontSize: 14),
              ),
            ),
          );
        }
      },
    );
  }
}
