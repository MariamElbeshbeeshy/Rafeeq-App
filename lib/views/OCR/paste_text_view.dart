import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class PasteTextView extends StatefulWidget {
  const PasteTextView({super.key});

  @override
  State<PasteTextView> createState() => _PasteTextViewState();
}

class _PasteTextViewState extends State<PasteTextView> with AutomaticKeepAliveClientMixin<PasteTextView> {
  @override
  bool get wantKeepAlive => true;
 
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: ' اكتب النص الذى تحتاج تبسيطه',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              contentPadding: EdgeInsets.all(12),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 19.h),
        Row(
          children: [
            
             SizedBox(
              width: 94.w,
              height: 44.h,
              child: ElevatedButton(
                onPressed:null,
                // () {
                //   // Handle continue action
                //   String text = _textController.text;
                //   if (text.isNotEmpty) {
                //     // Process the text
                //   }
                // },
                child: Text(
                  'استمر',
                ),
              ),
            ),
            SizedBox(width:10 ),

            SizedBox(
              width: 94.w,
              height: 44.h,
              child: OutlinedButton(
                onPressed: () {
                  _textController.clear();
                },
                child: Text(
                  'الغاء',
                ),
              ),
            ),

           
           
          ],
        ),
      ],
    );
  }
}
