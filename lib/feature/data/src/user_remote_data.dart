import 'dart:convert';

import 'package:jsonplaceholder/core/error/exeption.dart';
import 'package:jsonplaceholder/feature/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteData {
  Future<List<UserModel>> getAllUsers();
}

class UserRemoteDataImpl implements UserRemoteData {
  final http.Client client;

  UserRemoteDataImpl({required this.client});
  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body);
      return (users as List).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw ServerExeption();
    }
  }
}
