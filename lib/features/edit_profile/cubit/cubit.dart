import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/edit_profile/cubit/state.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitiateState());

  static EditProfileCubit get(BuildContext context) =>BlocProvider.of(context);

  Future editProfile({
    required String name,
    required String username,
    required String mobileNumber,
    required String email,
    required String identityNumber,
}) async {
    emit(EditProfileLoadingState());
    await DioHelper.postData(
      path: EndPoint.updateProfile,
      token: token,
      data: {
        "ProfileID": loginModel!.resultObject!.profileID!.toInt(),
        "ProfileName": name,
        "UserName": username,
        "Gender": 1,
        "MobileNumber":mobileNumber,
        "Email":email,
        "IdentityNumber" :identityNumber
      },
    ).then((value) {
      print(value.data['ResultType']);
      emit(EditProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(EditProfileErrorState());
    });
  }

}