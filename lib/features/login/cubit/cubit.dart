import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/login/cubit/states.dart';
import 'package:edhp/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) =>BlocProvider.of(context);


  Future login({
    required String username ,
    required String password,
  }) async{
    emit(LoginLoadingState());
    print('Username: $username, Password: $password');
    return await DioHelper.postData(
      path: EndPoint.login,
      data: {
        "userName" : username,
        "password" : password
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('############Login Model###############');
      print(loginModel);
      print('token : ${value.data['ResultObject']['AccessToken']}');
      token = value.data['ResultObject']['AccessToken'];
      print(token);
      emit(LoginSuccessfullyState());
    }).catchError((error) {
      emit(LoginErrorState(error: error.toString()));
      print(error.toString());
    });
  }
}