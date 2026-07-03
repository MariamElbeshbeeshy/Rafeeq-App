import '../../models/HomeModel/home_model.dart';

int calculateCurrentStreak(List<StreakInfo> streakDays) {
    streakDays.sort((a, b) => a.date.compareTo(b.date));

    int currentStreak = 0;

    for (int i = streakDays.length - 1; i >= 0; i--) {
      final day = streakDays[i];

      if (day.isCompleted) {
        currentStreak++;
      } else {
        if (day.isToday) {
          continue;
        } else {
          currentStreak = 0;
          break;
        }
      }
    }
    return currentStreak;
  }