import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'VentureOrder.g.dart';

@JsonSerializable()
class VentureOrder {
  VentureOrder();
  int id;

  String order_id;

  int venture_money;

  int market_id;

  String user_tel_phone;

  String order_time;

  int order_statue;

  int order_venture_time;

  factory VentureOrder.fromJson(Map<String, dynamic> json) =>
      _$VentureOrderFromJson(json);

  Map<String, dynamic> toJson() => _$VentureOrderToJson(this);
}
