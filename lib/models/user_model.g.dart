// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  firstname: json['first_name'] as String,
  lastname: json['last_name'] as String,
  token:json['token'] as String
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'first_name': instance.firstname,
  'last_name': instance.lastname,
  'token':instance.token
};
