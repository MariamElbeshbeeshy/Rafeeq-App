class FontSettingsModel {
  double fontSize;
  String fontFamily;
  FontSettingsModel({required this.fontSize, required this.fontFamily});

  FontSettingsModel copyWith({double? fontSize, String? fontFamily}) {
    return FontSettingsModel(
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
