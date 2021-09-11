import 'package:app_builder/model/app_config.dart';
import 'package:app_builder/model/post.dart';
import 'package:app_builder/provider/app_config_provider.dart';
import 'package:app_builder/provider/posts_provider.dart';
import 'package:app_builder/services/response_wrapper.dart';
import 'package:app_builder/widgets/base_appbar.dart';
import 'package:app_builder/widgets/navigation_drawer.dart';
import 'package:app_builder/widgets/no_connection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatelessWidget {
  AppConfigProvider? appConfigProvider;
  PostsProvider? postsProvider;
  MenuItem menuItem;

  PostsScreen({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of<AppConfigProvider>(context, listen: false);
    postsProvider = Provider.of<PostsProvider>(context, listen: true);

    return Scaffold(
        backgroundColor: appConfigProvider!.getPageBackgroundColor(),
        drawer: NavigationDrawer(),
        appBar: BaseAppBar(title:menuItem.title ?? ""),
        body: FutureBuilder<ResponseWrapper>(
            future: postsProvider!.getPosts(appConfigProvider!.getBaseUrl(), menuItem),
            builder: (BuildContext context, AsyncSnapshot<ResponseWrapper> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return checkResponseState(snapshot.data!);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget checkResponseState(ResponseWrapper responseWrapper){
    if(responseWrapper.success){
      return getPostsList(responseWrapper.response as List<Post>);
    }else{
      print(responseWrapper.code);
      return NoConnection(reload: (){
        postsProvider!.renderScreen();
      });
    }
  }

  Widget getPostsList(List<Post> posts) {
    if (posts.isEmpty) {
      return Center(child: Text("No Results Found", style: TextStyle(fontSize: 14)));
    } else {
      return ListView.separated(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: appConfigProvider!.getListItemBackgroundColor(),
              child: ListTile(
                leading: Text("(${index + 1})", style: TextStyle(color: appConfigProvider!.getTextColor())),
                title: Text(posts[index].title, style: TextStyle(color: appConfigProvider!.getListTitleColor())),
                subtitle: Text(posts[index].body, style: TextStyle(color: appConfigProvider!.getTextColor())),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(height: 10);
          });
    }
  }
}
