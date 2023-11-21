import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/models/user_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/dio_helper.dart';
import 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  static GetProfileCubit get(BuildContext context) => BlocProvider.of(context);

  GetUserProfile ? userProfileModel;

  Future getProfile() async {
    emit(GetProfileLoadingState());
    await DioHelper.getData(
      path: EndPoint.getProfile ,
      token: token,
    ).then((value) {
      print(value.data);
      userProfileModel = GetUserProfile.fromJson(value.data);
      print(userProfileModel!.userName);
      emit(GetProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }
}
