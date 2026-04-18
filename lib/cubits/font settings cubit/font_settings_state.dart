part of 'font_settings_cubit.dart';

@immutable
sealed class FontSettingsState {
  final FontSettingsModel fontSettings;
  const FontSettingsState({required this.fontSettings});
}

final class FontSettingsInitial extends FontSettingsState {
  FontSettingsInitial({required super.fontSettings});
}

final class FontSettingsUpdated extends FontSettingsState {
  const FontSettingsUpdated({required super.fontSettings});
}