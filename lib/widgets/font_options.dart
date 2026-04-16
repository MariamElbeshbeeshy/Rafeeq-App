import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/custom_card.dart';

class FontOptions extends StatelessWidget {
  FontOptions({super.key});
  double _fontSizeValue = 50;

  @override
  Widget build(BuildContext context) {
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
                  '${_fontSizeValue.toInt()}%',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1C1E),
                  ),
                ),
              ),
              Slider(
                value: _fontSizeValue,
                min: 50,
                max: 200,
                onChanged: (value) {
                  _fontSizeValue = value;
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
                initialSelection: 'Cairo',
                dropdownMenuEntries: kFontOptions,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
