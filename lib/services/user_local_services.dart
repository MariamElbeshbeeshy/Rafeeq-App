import 'package:hive_flutter/hive_flutter.dart';
import 'package:rafeeq_app/models/ChildModel/user_data_model.dart';

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

  Future<UserDataModel?> updateUserData(Map<String, dynamic> json) async {
    final box = Hive.box<UserDataModel>(_userBoxName);
    final oldData = box.get(_userKey);

    if (oldData != null) {
      final updatedData = UserDataModel(
        id: json['id'] ?? oldData.id,
        firstName: json['firstName'] ?? oldData.firstName,
        lastName: json['lastName'] ?? oldData.lastName,
        birthDate: json['birthDate'] ?? oldData.birthDate,
        gender: json['gender'] ?? oldData.gender,
        nationalityId: json['nationalityId'] ?? oldData.nationalityId,
        image: json['image'] ?? oldData.image,
        level: json['level'] ?? oldData.level,
        token: oldData.token,
        points: json['points'] ?? oldData.points,
        fontSize: json['fontSize'] ?? oldData.fontSize,
        fontType: json['fontType'] ?? oldData.fontType,
      );
      saveUserData(updatedData);
    } else {
      saveUserData(UserDataModel.fromJson(json));
    }
    return getUserData();
  }
}
