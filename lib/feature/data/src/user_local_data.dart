import 'dart:convert';

import 'package:jsonplaceholder/core/error/exeption.dart';
import 'package:jsonplaceholder/feature/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalData {
  Future<List<UserModel>> getListUsersFromCache();
  Future<void> setUsersToCache(List<UserModel> usersList);
}

const String cachedUsersList = 'CACHED_USERS_LIST';

class UserLocalDataImpl implements UserLocalData {
  SharedPreferences sharedPreferences;

  UserLocalDataImpl({required this.sharedPreferences});

  @override
  Future<List<UserModel>> getListUsersFromCache() async {
    sharedPreferences = await SharedPreferences.getInstance();

    final usersListJson = sharedPreferences.getStringList(cachedUsersList);
    if (usersListJson != null && usersListJson.isNotEmpty) {
      return usersListJson
          .map((e) => UserModel.fromJson(jsonDecode(e)))
          .toList();
    } else {
      throw CacheExeption();
    }
  }

  @override
  Future<void> setUsersToCache(List<UserModel> usersList) async {
    final List<String> usersListJson =
        usersList.map((e) => jsonEncode(e.toJson())).toList();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setStringList(cachedUsersList, usersListJson);
  }
}
