import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibility());
  }

  Future signUp({
    required String name,
    required String email,
    required String username,
    required String password,
    required String mobileNumber,
  }) async{

    emit(SignUpLoadingState());

    await DioHelper.postData(
      path: EndPoint.register,
      data: {
        "name": name,
        "email": email,
        "userName": username,
        "password": password,
        "MobileNumber": mobileNumber,
      },
    ).then((value) {
      print(value.data['ResultObject']['AccessToken']);
      token = value.data['ResultObject']['AccessToken'];
      print(token);
      emit(SignUpSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(SignUpErrorState());
    });
  }

}
