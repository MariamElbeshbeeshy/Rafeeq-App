import 'package:flutter/material.dart';

class RegisterNowSection extends StatelessWidget {
  const RegisterNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('لا يوجد لديك حساب؟ '),
        GestureDetector(
          onTap: () {},
          child: Text(
            'أنشئ حسابًا الآن',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
