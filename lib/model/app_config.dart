import 'dart:convert';

AppConfig appConfigFromJson(String str) => AppConfig.fromJson(json.decode(str));

class AppConfig {
  MainConfig? mainConfig;
  AppColor? appColor;
  List<MenuItem>? menuItems;

  AppConfig({this.mainConfig, this.appColor, this.menuItems});

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
    mainConfig: json["mainConfig"] == null ? null : MainConfig.fromJson(json["mainConfig"]),
    appColor: json["appColor"] == null ? null : AppColor.fromJson(json["appColor"]),
    menuItems: json["menuItems"] == null ? null : List<MenuItem>.from(json["menuItems"].map((x) => MenuItem.fromJson(x))),
  );
}

class AppColor {
  String? pageBg;
  String? headerBg;
  String? headerText;
  String? menuBg;
  String? menuItemBgColor;
  String? menuItemSelectedBgColor;
  String? listTitle;
  String? listItemBg;
  String? textColor;

  AppColor({
    this.pageBg, this.headerBg, this.headerText,
    this.menuBg, this.menuItemBgColor, this.menuItemSelectedBgColor,
    this.listTitle, this.listItemBg, this.textColor
  });

  factory AppColor.fromJson(Map<String, dynamic> json) => AppColor(
    pageBg: json["pageBg"] == null ? null : json["pageBg"],
    headerBg: json["headerBg"] == null ? null : json["headerBg"],
    headerText: json["headerText"] == null ? null : json["headerText"],
    menuBg: json["menuBg"] == null ? null : json["menuBg"],
    menuItemBgColor: json["menuItemBGColor"] == null ? null : json["menuItemBGColor"],
    menuItemSelectedBgColor: json["menuItemSelectedBgColor"] == null ? null : json["menuItemSelectedBgColor"],
    listTitle: json["listTitle"] == null ? null : json["listTitle"],
    listItemBg: json["listItemBg"] == null ? null : json["listItemBg"],
    textColor: json["textColor"] == null ? null : json["textColor"],
  );
}

class MainConfig {
  String? baseUrl;

  MainConfig({this.baseUrl});

  factory MainConfig.fromJson(Map<String, dynamic> json) => MainConfig(
    baseUrl: json["baseUrl"] == null ? null : json["baseUrl"],
  );
}

class MenuItem {
  String? component;
  Parameters? parameters;
  String? title;

  MenuItem({this.component, this.parameters, this.title});

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
    component: json["component"] == null ? null : json["component"],
    parameters: json["parameters"] == null ? null : Parameters.fromJson(json["parameters"]),
    title: json["title"] == null ? null : json["title"],
  );
}

class Parameters {
  String? apiName;
  int? userId;
  String? url;

  Parameters({this.apiName, this.userId, this.url});

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    apiName: json["apiName"] == null ? null : json["apiName"],
    userId: json["userId"] == null ? null : json["userId"],
    url: json["url"] == null ? null : json["url"],
  );
}
