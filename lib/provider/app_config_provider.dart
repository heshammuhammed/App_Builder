import 'package:app_builder/base/hex_color.dart';
import 'package:app_builder/model/app_config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppConfigProvider extends ChangeNotifier {
  AppConfig? appConfig;
  int _selectedNavigationItem = -1;

  Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectionResult = ConnectivityResult.none;

  AppConfigProvider(){
    getAppConfig();
    getConnectivity();
  }

  void getAppConfig() async {
    String jsonString = await rootBundle.loadString('assets/config.json');
    appConfig = appConfigFromJson(jsonString);
    notifyListeners();
  }

  void getConnectivity() async{
    _connectionResult = await _connectivity.checkConnectivity();
    _connectivity.onConnectivityChanged.listen((result) {
      _connectionResult = result;
    });
  }

  String getBaseUrl(){
    return appConfig!.mainConfig!.baseUrl!;
  }

  Color getPageBackgroundColor(){
    return HexColor(appConfig!.appColor!.pageBg!);
  }

  Color getHeaderBackgroundColor(){
    return HexColor(appConfig!.appColor!.headerBg!);
  }

  Color getHeaderTextColor(){
    return HexColor(appConfig!.appColor!.headerText!);
  }

  Color getMenuBackgroundColor(){
    return HexColor(appConfig!.appColor!.menuBg!);
  }

  Color getMenuItemBackgroundColor(){
    return HexColor(appConfig!.appColor!.menuItemBgColor!);
  }

  Color getMenuItemSelectedBackgroundColor(){
    return HexColor(appConfig!.appColor!.menuItemSelectedBgColor!);
  }

  Color getListTitleColor(){
    return HexColor(appConfig!.appColor!.listTitle!);
  }

  Color getListItemBackgroundColor(){
    return HexColor(appConfig!.appColor!.listItemBg!);
  }

  Color getTextColor(){
    return HexColor(appConfig!.appColor!.textColor!);
  }

  int get selectedNavigationItem => _selectedNavigationItem;

  set selectedNavigationItem(int value) {
    _selectedNavigationItem = value;
  }

  ConnectivityResult get connectionResult => _connectionResult;
}