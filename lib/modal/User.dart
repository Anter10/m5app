import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  User();

  int id;
  String id_card;
  String name;
  String email;
  String address;
  String tel_phone;
  int priviledge_level;
  String register_time;
  String password;
  double total_out;
  double balance;
  double out_profit;
  String bank_id;
  String bank_name;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
