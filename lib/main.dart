import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/app_config_provider.dart';
import 'provider/external_page_provider.dart';
import 'provider/posts_provider.dart';
import 'screens/navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppConfigProvider()),
        ChangeNotifierProvider(create: (_) => PostsProvider()),
        ChangeNotifierProvider(create: (_) => ExternalPageProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Task',
        home: NavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}