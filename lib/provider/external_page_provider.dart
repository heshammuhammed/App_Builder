import 'app_config_provider.dart';

class ExternalPageProvider extends AppConfigProvider{

 void renderScreen(){
  notifyListeners();
 }

}