import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/data_model.dart';

class ApiManager {
  Future<DataModel> getNews() async {
    var client = http.Client();
    var newsData = null;
    try {
      var url = Uri.parse(
        'https://reflexit.digitalshastho.com/api/mobile_apps_user_profile/doctorappoinmentlist/9',
      );
      var response = await client.get(url);
      //debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsData = DataModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      //debugPrint('Error');
      return newsData;
    }
    return newsData;
  }
}
