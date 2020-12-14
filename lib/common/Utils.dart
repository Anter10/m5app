import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:event_bus/event_bus.dart';

Color nagivator_bottom_color = Color.fromARGB(255, 52, 90, 128);

String tel_test_phone = "15810757355";

EventBus event_bus = new EventBus();

/// Flutter code sample for Form

// This example shows a [Form] with one [TextFormField] to enter an email
// address and an [ElevatedButton] to submit the form. A [GlobalKey] is used here
// to identify the [Form] and validate input.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/form.png)

void ShowToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

class HttpUtil {
  // static String url = "http://192.168.101.25:8081/";
  static String url = "http://192.168.1.117:8081/";
  // static String url = "http://192.168.100.155:8081/";
  static bool posting = false;

  static post(String uri, dynamic body, Function callback) async {
    if (posting) {
      return;
    }
    posting = true;
    var response =
        await http.post(HttpUtil.url + uri, body: convert.jsonEncode(body));
    posting = false;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonResponse["code"] != 0) {
        ShowToast(jsonResponse["msg"]);
      } else {
        callback(jsonResponse);
      }
    } else {
      print('Request failed with status');
    }
  }
}
