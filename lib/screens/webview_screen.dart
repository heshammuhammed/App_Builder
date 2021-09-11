import 'dart:io';
import 'package:app_builder/model/app_config.dart';
import 'package:app_builder/provider/app_config_provider.dart';
import 'package:app_builder/provider/external_page_provider.dart';
import 'package:app_builder/widgets/base_appbar.dart';
import 'package:app_builder/widgets/navigation_drawer.dart';
import 'package:app_builder/widgets/no_connection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  MenuItem menuItem;
  WebViewScreen({required this.menuItem});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  AppConfigProvider? appConfigProvider;
  ExternalPageProvider? externalPageProvider;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid){
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of<AppConfigProvider>(context, listen: false);
    externalPageProvider = Provider.of<ExternalPageProvider>(context, listen: true);

    return Scaffold(
        backgroundColor: appConfigProvider!.getPageBackgroundColor(),
        drawer: NavigationDrawer(),
        appBar: BaseAppBar(title: widget.menuItem.title ?? ""),
        body: checkConnectivity());
  }

  Widget checkConnectivity(){
    if(appConfigProvider!.connectionResult != ConnectivityResult.none){
      return WebView(initialUrl: widget.menuItem.parameters!.url);
    }else{
      return NoConnection(reload: (){
        externalPageProvider!.renderScreen();
      });
    }
  }

}
