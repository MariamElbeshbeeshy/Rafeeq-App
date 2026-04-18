import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/font%20settings%20cubit/font_settings_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/custom_card.dart';

class FontOptions extends StatelessWidget {
  const FontOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontSettingsCubit, FontSettingsState>(
      builder: (context, state) {
        final currentSettings = state.fontSettings;
        return Column(
          children: [
            CustomCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // For Arabic alignment
                children: [
                  Text(
                    'حجم الخط',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff101828),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${currentSettings.fontSize.toInt()}%',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1C1E),
                      ),
                    ),
                  ),
                  Slider(
                    value: state.fontSettings.fontSize,
                    min: 50,
                    max: 150,
                    onChanged: (value) {
                      context.read<FontSettingsCubit>().changeFontSize(value);
                      context.read<FontSettingsCubit>().updateFontOnBackend();
                    },
                  ),
                ],
              ),
            ),

            CustomCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'نوع الخط',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff101828),
                    ),
                  ),
                  DropdownMenu(
                    width: 206.w,
                    trailingIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff101828),
                    ),
                    selectedTrailingIcon: Icon(
                      Icons.keyboard_arrow_up,
                      color: Color(0xff101828),
                    ),
                    initialSelection: currentSettings.fontFamily,
                    onSelected: (value) {
                      if (value != null) {
                        context.read<FontSettingsCubit>().changeFontFamily(
                          value,
                        );
                        context.read<FontSettingsCubit>().updateFontOnBackend();
                      }
                    },
                    dropdownMenuEntries: kFontOptions,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
