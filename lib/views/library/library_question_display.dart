import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/library%20cubit/library_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/models/ChildModel/user_data_model.dart';
import 'package:rafeeq_app/models/Library/library_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/widgets/header_level_info.dart';
import 'package:rafeeq_app/widgets/mcq.dart';

class LibraryQuestionDisplay extends StatelessWidget {
  final LibraryItemModel item;
  const LibraryQuestionDisplay({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    UserDataModel? userData = UserLocalServices().getUserData();
    final currentQuestion = item.question;
    final options = currentQuestion.options;

    final int correctOptionIndex = options.indexWhere(
      (option) => option.id == item.answerId,
    );

    final int targetIndex = correctOptionIndex != -1 ? correctOptionIndex : 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<LibraryCubit, LibraryState>(
          listener: (context, state) {
            if (state is LibraryUpdated) {
              ShowMessage(context, [
                Image.asset("assets/images/emojione_fire.png", height: 106.h),
                SizedBox(height: 10.h),
                Text(
                  state.message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ], []);

              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            } else if (state is LibraryError) {
              ShowMessage(
                context,
                [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ],
                [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("حاول مرة أخرى"),
                  ),
                ],
              );
            }
          },
          builder: (context, state) {
            if (state is LibraryLoading) {
              return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        spacing: 15,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back_ios),
                              ),
                              Spacer(),
                              Center(
                                child: HeaderLevelInfo(userData: userData),
                              ),
                              //Spacer(),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "مراجعة السؤال من ${item.levelTitle}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),

                          SizedBox(height: 10.h),

                          // الـ MCQ widget
                          Mcq(
                            options: options,
                            question: currentQuestion,
                            selectedIndex: targetIndex,
                            onSelect: (index) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      onPressed: () async {
                        context.read<LibraryCubit>().deleteLibraryItem(
                          item.questionId,
                        );
                        await Future.delayed(Duration(seconds: 2));
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "تم إتقان السؤال",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
