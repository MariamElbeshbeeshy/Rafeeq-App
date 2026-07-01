import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:pinput/pinput.dart';
import 'package:rafeeq_app/cubits/otp%20cubit/otp_cubit.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/views/otp_view.dart';
import 'package:rafeeq_app/views/profile_view.dart';
import 'package:rafeeq_app/views/test_view.dart';
import 'package:rafeeq_app/views/quistions/mcq_view.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  TextEditingController _controller = TextEditingController();
  String? otpCode;
  bool? isCorrectOtp;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color(0xffFEC108)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(color: Colors.grey[200]),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(8),
    );

    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpVervicationSuccess) {
          setState(() {
            isCorrectOtp = true;
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                TestView.id,
                (Route<dynamic> route) => route.settings.name == OtpView.id,
              );
            }
          });

          // ShowMessage(context, state.message, [
          //   ElevatedButton(
          //     onPressed: () => Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       TestView.id,
          //       (Route<dynamic> route) => route.settings.name == OtpView.id,
          //     ),
          //     child: Text("التالي"),
          //   ),
          //]);
        } else if (state is OtpVervicationError) {
          setState(() {
            isCorrectOtp = false;
          });
        }
      },
      child: Container(
        child: Column(
          children: [
            Text(
              "راجع بريدك الإلكترونى",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "لقد أرسلنا إليك رمز التأكيد عبر البريد الإلكترونى",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 18.h),

            //// otp  confirmation ////
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                errorPinTheme: errorPinTheme,
                controller: _controller,
                forceErrorState: isCorrectOtp == false,
                errorText: 'رمز التأكيد غير صحيح',
                // validator: (s) {
                //   otpCode = s;
                //   BlocProvider.of<OtpCubit>(context).otpVerify(otpCode);
                //   return isCorrectOtp == true ? 'رمز التأكيد غير صحيح' : null;
                // },
                onChanged: (value) {
                  setState(() {
                    isCorrectOtp = null;
                  });
                },
                onCompleted: (pin) {
                  BlocProvider.of<OtpCubit>(context).otpVerify(pin);
                },

                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
              ),
            ),

            SizedBox(height: 24.h),

            ///timer///
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تنتهي صلاحية الدخول خلال   ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
                TimerCountdown(
                  enableDescriptions: false,
                  format: CountDownTimerFormat.minutesSeconds,
                  endTime: DateTime.now().add(Duration(minutes: 3, seconds: 0)),
                  timeTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            /// buttons/ ///
            // ElevatedButton(
            //   onPressed: () {
            //     BlocProvider.of<OtpCubit>(context).otpVerify("1234");
            //   },
            //   child: Text("تأكيد"),
            // ),
            //SizedBox(height: 16.h),
            OutlinedButton(
              onPressed: () {
                _controller.clear();
                isCorrectOtp = null;
              },
              child: Text("أرسل الرمز مرة أخرى"),
            ),
          ],
        ),
      ),
    );
  }
}
