import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/modal/User.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class AddAccountViewWidget extends StatelessWidget {
  AddAccountViewWidget({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String tel_phone;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 52, 90, 128),
            title: Text(
              "账号登陆",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: '请输入手机号',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '输入手机号不能为空';
                          }
                          this.tel_phone = value;
                          return null;
                        },
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: '请输入密码',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '输入密码不能为空';
                          }
                          this.password = value;

                          return null;
                        },
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return EdgeInsets.all(10);
                                  } else {
                                    return EdgeInsets.all(10);
                                  }
                                }),
                                textStyle:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return TextStyle(fontSize: 18);
                                  } else {
                                    return TextStyle(fontSize: 18);
                                  }
                                }),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return nagivator_bottom_color;
                                  }
                                  return nagivator_bottom_color;
                                }),
                              ),
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  // Process data.
                                  var login_data = {
                                    "tel_phone": this.tel_phone,
                                    "password": this.password
                                  };

                                  HttpUtil.post("login/", login_data,
                                      (dynamic data) {
                                       print("登陆数据回调 = ${data}");
                                       User user  = User.fromJson(data["result"]);
                                       Cache.user = user;
                                       Navigator.pop(context);
                                       event_bus.fire("event");
                                  });
                                }
                              },
                              child: Text('登陆'),
                            ),
                          )),
                    ],
                  ),
                ))
          ],
        ));
  }
}

class AddAccountViewState extends State<AddAccountView> {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return AddAccountViewWidget();
  }
}

/// This Widget is the main application widget.
class AddAccountView extends StatefulWidget {
  @override
  AddAccountViewState createState() => AddAccountViewState();
}
