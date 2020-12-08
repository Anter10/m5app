// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VentureOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VentureOrder _$VentureOrderFromJson(Map<String, dynamic> json) {
  return VentureOrder()
    ..id = json['id'] as int
    ..order_id = json['order_id'] as String
    ..venture_money = json['venture_money'] as int
    ..market_id = json['market_id'] as int
    ..user_tel_phone = json['user_tel_phone'] as String
    ..order_time = json['order_time'] as String
    ..order_statue = json['order_statue'] as int
    ..order_venture_time = json['order_venture_time'] as int;
}

Map<String, dynamic> _$VentureOrderToJson(VentureOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'venture_money': instance.venture_money,
      'market_id': instance.market_id,
      'user_tel_phone': instance.user_tel_phone,
      'order_time': instance.order_time,
      'order_statue': instance.order_statue,
      'order_venture_time': instance.order_venture_time,
    };
