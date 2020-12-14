// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..id_card = json['id_card'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..address = json['address'] as String
    ..tel_phone = json['tel_phone'] as String
    ..priviledge_level = json['priviledge_level'] as int
    ..register_time = json['register_time'] as String
    ..password = json['password'] as String
    ..total_out = (json['total_out'] as num)?.toDouble()
    ..balance = (json['balance'] as num)?.toDouble()
    ..out_profit = (json['out_profit'] as num)?.toDouble()
    ..bank_id = json['bank_id'] as String
    ..bank_name = json['bank_name'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'id_card': instance.id_card,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'tel_phone': instance.tel_phone,
      'priviledge_level': instance.priviledge_level,
      'register_time': instance.register_time,
      'password': instance.password,
      'total_out': instance.total_out,
      'balance': instance.balance,
      'out_profit': instance.out_profit,
      'bank_id': instance.bank_id,
      'bank_name': instance.bank_name,
    };
