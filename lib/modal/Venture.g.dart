// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Venture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venture _$VentureFromJson(Map<String, dynamic> json) {
  return Venture()
    ..id = json['id'] as int
    ..venture_user_tel_phone = json['venture_user_tel_phone'] as String
    ..market_id = json['market_id'] as int
    ..venture_money = (json['venture_money'] as num)?.toDouble()
    ..trading_money = (json['trading_money'] as num)?.toDouble();
}

Map<String, dynamic> _$VentureToJson(Venture instance) => <String, dynamic>{
      'id': instance.id,
      'venture_user_tel_phone': instance.venture_user_tel_phone,
      'market_id': instance.market_id,
      'venture_money': instance.venture_money,
      'trading_money': instance.trading_money,
    };
