import 'package:app_builder/model/post.dart';
import 'package:app_builder/services/response_wrapper.dart';
import 'package:http/http.dart' as http;

class PostService {

  Future<ResponseWrapper> getPosts(String url) async{
    ResponseWrapper? responseWrapper;
    try{
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      if(response.statusCode == 200){
        responseWrapper = ResponseWrapper(response: postFromJson(response.body), success: true);
      }else{
        responseWrapper = ResponseWrapper(success: false, code: response.statusCode);
      }
    }catch(e){
      responseWrapper = ResponseWrapper(success: false);
    }

    return Future.value(responseWrapper);
  }

}