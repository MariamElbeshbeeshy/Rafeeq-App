import 'package:hive_flutter/hive_flutter.dart';
import 'package:rafeeq_app/models/HomeModel/home_model.dart';

class HomeLocalServices {
  static const String _homeBoxName = 'home info';
  static const String _homeKey = 'homeData';

  Future<void> saveHomeData(HomeModel homeData) async {
    final box = Hive.box<HomeModel>(_homeBoxName);
    await box.put(_homeKey, homeData);
  }

  Future<HomeModel?> getHomeData() async {
    final box = Hive.box<HomeModel>(_homeBoxName);
    return box.get(_homeKey);
  }

  Future<void> clearHomeData() async {
    final box = Hive.box<HomeModel>(_homeBoxName);
    await box.delete(_homeKey);
  }
}
