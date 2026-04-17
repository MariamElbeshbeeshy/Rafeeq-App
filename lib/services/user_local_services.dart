import 'package:hive_flutter/hive_flutter.dart';
import 'package:rafeeq_app/models/user_data_model.dart';

class UserLocalServices {
  static const String _userBoxName = 'userBox';
  static const String _userKey = 'currentUser';

  void saveUserData(UserDataModel user) {
    var box = Hive.box<UserDataModel>(_userBoxName);
    box.put(_userKey, user);
  }

  UserDataModel? getUserData() {
    var box = Hive.box<UserDataModel>(_userBoxName);
    return box.get(_userKey);
  }

  void clearUserData() {
    var box = Hive.box<UserDataModel>(_userBoxName);
    box.delete(_userKey);
  }

  String? getToken() {
  final user = getUserData();
  return user?.token;
}
}
