
import 'dart:convert';

import 'package:simple_mvvm/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{

  UserModel({
    required super.id,
    required super.name,
    required super.email
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email']
    );
  }

}