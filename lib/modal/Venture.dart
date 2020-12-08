import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'Venture.g.dart';

@JsonSerializable()
class Venture {
  Venture();

  int id;

  String venture_user_tel_phone;

  int market_id;

  double venture_money;

  double trading_money;


  factory Venture.fromJson(Map<String, dynamic> json) =>
      _$VentureFromJson(json);

  Map<String, dynamic> toJson() => _$VentureToJson(this);
}