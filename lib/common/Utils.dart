import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;



class HttpUtil {
  static String url = "http://192.168.101.25:8081/";

  static post(String uri,dynamic body, Function callback) async {
    var response = await http.post(HttpUtil.url + uri, body:convert.jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      callback(jsonResponse);
    } else {
      print('Request failed with status');
    }
  }
}
