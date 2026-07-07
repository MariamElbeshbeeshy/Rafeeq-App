import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rafeeq_app/models/HomeModel/home_model.dart';
import 'package:rafeeq_app/services/home_local_services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await Hive.initFlutter();
    await Hive.deleteBoxFromDisk('home info');
    await Hive.openBox<HomeModel>('home info');
  });

  tearDown(() async {
    await Hive.close();
  });

  test('saves and retrieves cached home data', () async {
    final service = HomeLocalServices();
    final homeModel = HomeModel(
      statusCode: 200,
      key: 'home',
      message: 'ok',
      data: HomeDataModel(
        headerInfo: HeaderInfo(currentLevelId: 3, points: 150),
        streakInfo: [
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
          StreakInfo(
            date: DateTime(2024, 1, 1),
            dayName: 'Mon',
            isCompleted: true,
            isToday: false,
          ),
        ],
        levelsList: [
          LevelsList(
            id: 1,
            title: 'First level',
            description: 'Description',
            status: 1,
            completionPercentage: 100,
          ),
        ],
      ),
    );

    await service.saveHomeData(homeModel);
    final cached = await service.getHomeData();

    expect(cached, isNotNull);
    expect(cached!.statusCode, 200);
    expect(cached.data.headerInfo.points, 150);
    expect(cached.data.levelsList.first.title, 'First level');
  });
}
