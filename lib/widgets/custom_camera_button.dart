import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCameraButton extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomCameraButton({Key? key, required this.onPressed})
    : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCameraButtonState createState() => _CustomCameraButtonState();
}

class _CustomCameraButtonState extends State<CustomCameraButton> {
  double _scale = 1.0; 

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.9); 
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0); 
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: () => setState(() => _scale = 1.0),
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 100), 
          child: Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.w),
            ),
            padding: EdgeInsets.all(6.w),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
