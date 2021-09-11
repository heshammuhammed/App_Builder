import 'package:app_builder/model/app_config.dart';
import 'package:app_builder/services/post_service.dart';
import 'package:app_builder/services/response_wrapper.dart';

import 'app_config_provider.dart';

class PostsProvider extends AppConfigProvider {
  PostService _postService = new PostService();

  Future<ResponseWrapper> getPosts(String baseUrl, MenuItem menuItem){
    String url = baseUrl;
    url = url + "/" + menuItem.parameters!.apiName!;

    if(menuItem.parameters!.userId != null){
      url = url + "?userId=${menuItem.parameters!.userId}";
    }
    return _postService.getPosts(url);
  }

  void renderScreen(){
    notifyListeners();
  }

}