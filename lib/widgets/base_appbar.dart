import 'package:app_builder/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppConfigProvider? appConfigProvider;
  String title;

  BaseAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of(context, listen: false);
    return AppBar(
        title: Text(title, style: TextStyle(color: appConfigProvider!.getHeaderTextColor())),
        backgroundColor: appConfigProvider!.getHeaderBackgroundColor());
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
