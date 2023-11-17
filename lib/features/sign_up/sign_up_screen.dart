import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_components/widgets/default_button.dart';
import '../../core/utils/app_components/widgets/default_text_button.dart';
import '../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';
import '../login/widgets/or_divider.dart';
import '../login/widgets/row_of_register_apps.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
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
                const Text('إنشاء حساب جديد' , style: Styles.textStyle32W500,),
                Text('قم بملئ البيانات التالية لإنشاء حسابك' , style: Styles.textStyle16W400.copyWith(color: const Color(0xFF333333)),),
                const SizedBox(height: 30,),
                DefaultTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validation: (value){

                  },
                  fieldName: 'الاسم',
                  suffixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 15,),
                DefaultTextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  validation: (value){

                  },
                  fieldName: 'رقم الهاتف',
                  suffixIcon: Icons.call_outlined,
                ),
                const SizedBox(height: 15,),
                DefaultTextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validation: (value){

                  },
                  fieldName: 'البريد الإلكتروني',
                  suffixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 15,),
                DefaultTextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  validation: (value){

                  },
                  fieldName: 'كلمة السر',
                  suffixIcon: Icons.lock_outline,
                  prefixIcon: Icons.visibility_outlined,
                  onPressedPrefixIcon: (){

                  },
                ),
                const SizedBox(height: 26,),
                DefaultButton(
                  function: (){

                  },
                  text: 'تسجيل',
                  redius: 10,
                ),
                const SizedBox(height: 15,),
                const OrDivider(),
                const SizedBox(height: 15,),
                const RowOfRegisterApps(),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextButton(
                      text: 'دخول',
                      function: (){
                        GoRouter.of(context).push(AppRouters.kLoginScreen);
                      },
                    ),
                    Text('لديك حساب بالفعل ؟' , style: Styles.textStyle14W400.copyWith(color: AppColors.lightGrayColor),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
