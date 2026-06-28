import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/child%20cubit/child_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildCubit, ChildState>(
      builder: (context, state) {
        if (state is ChildDataError) {
          return Center(
            child: Text(
              'Error: ${state.errorMessage}',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state is ChildDataLoaded) {
          final childData = state.childData;
          return Column(
            children: [
              CircleAvatar(
                maxRadius: 63.5.r,
                backgroundImage: childData.image != null
                    ? NetworkImage(childData.image!)
                    : AssetImage("assets/images/user.png"),
              ),
              SizedBox(height: 10.h),
              Text(
                "${childData.firstName} ${childData.lastName}",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
