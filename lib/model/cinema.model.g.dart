// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cinema _$$_CinemaFromJson(Map<String, dynamic> json) => _$_Cinema(
      id: json['Id'] as int,
      name: json['p0'] as String,
      phone: json['p1'] as String,
      description: json['p2'] as String,
      status: json['p3'] as String,
      address: json['p4'] as String,
      email: json['p5'] as String,
      establishYear: json['p6'] as String,
    );

Map<String, dynamic> _$$_CinemaToJson(_$_Cinema instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'address': instance.address,
      'email': instance.email,
      'establishYear': instance.establishYear,
    };
