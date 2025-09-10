import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/models/user.dart';

class UserService {
  final String _boxName = "users";

  Future<bool> getUser({
    required String email,
    required String password,
  }) async {
    try {
      var data = await Hive.box(_boxName).get(email);

      if (data != null) {
        User user = User.fromMap(data);
        if (user.password == password) {
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<User?> addUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final User user = User(email: email, fullName: name, password: password);

    try {
      await Hive.box(_boxName).put(email, user.toMap());
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> isUSerFound({required String email}) async {
    try {
      var data = await Hive.box(_boxName).get(email);

      if (data != null) {
        User user = User.fromMap(data);
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> changePassword({required User modifiedUser}) async {
    try {
      await Hive.box(_boxName).put(modifiedUser.email, modifiedUser.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setCurrentUser(String email) async {
    try {
      await Hive.box("currentUser").put("currentEmail", email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      String userEmail = await Hive.box("currentUser").get("currentEmail");
      var data = await Hive.box(_boxName).get(userEmail);

      if (data != null) {
        User user = User.fromMap(data);
        return user;
      }
      return null;
    } catch (e) {
      log("$e");
      return null;
    }
  }

  Future<bool> deleteCurrentUser ()async{
    try {
      await Hive.box("currentUser").delete("currentEmail");
      return true;
    } catch (e) {
      return false;
    }
  }
}
