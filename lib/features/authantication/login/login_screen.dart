import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components/widgets/default_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../../core/utils/app_paths.dart';
import '../../../../core/utils/app_routers.dart';
import '../../../../core/utils/styles/styles.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'widgets/or_divider.dart';
import 'widgets/remember_me_row.dart';
import 'widgets/row_of_register_apps.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessfullyState){
            GoRouter.of(context).pushReplacement(AppRouters.kLayoutScreen);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: SvgPicture.asset(AppPaths.logoPath),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'سعداء بعودتك', style: Styles.textStyle32W500,),
                        Text('سجل دخول للدخول لحسابك',
                          style: Styles.textStyle16W400.copyWith(
                              color: const Color(0xFF333333)),),
                        const SizedBox(height: 30,),
                        DefaultTextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.text,
                          validation: (value) {
                            if(value!.isEmpty) {
                              return 'Phone Number must be not empty';
                            }
                            return null;
                          },
                          fieldName: 'رقم الهاتف',
                          suffixIcon: Icons.call_outlined,
                        ),
                        const SizedBox(height: 15,),
                        DefaultTextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          validation: (value) {
                            if(value!.isEmpty) {
                              return 'Password must be not empty';
                            }
                            return null;
                          },
                          fieldName: 'كلمة السر',
                          suffixIcon: Icons.lock_outline,
                          prefixIcon: cubit.suffix,
                          onPressedPrefixIcon: () {
                            cubit.changePasswordVisibility();
                          },
                          obscureText: cubit.isPassword,
                        ),
                        const RememberMeRow(),
                        const SizedBox(height: 26,),
                        if(state is LoginLoadingState)
                          const CircularProgressIndicator(color: AppColors.primaryBlueColor,),
                        if(state is LoginLoadingState)
                          const SizedBox(height: 26,),
                        DefaultButton(
                          function: () {
                            if(formKey.currentState!.validate()){
                              cubit.login(
                                username: phoneNumberController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                          text: ' دخول',
                          redius: 10,
                        ),
                        const SizedBox(height: 20,),
                        const OrDivider(),
                        const SizedBox(height: 20,),
                        const RowOfRegisterApps(),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultTextButton(
                              text: 'سجل',
                              function: () {
                                GoRouter.of(context).push(
                                    AppRouters.kSignUpScreen);
                              },
                            ),
                            Text('ليس لديك حساب  ؟',
                              style: Styles.textStyle14W400.copyWith(
                                  color: AppColors.lightGrayColor),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
