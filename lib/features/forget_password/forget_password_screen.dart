import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_components/widgets/default_button.dart';
import '../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();

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
                const Text('نسيت كلمة السر' , style: Styles.textStyle32W500,),
                Text('من فضلك ادخل رقم الهاتف لتتلقي كود لكتابتة' , style: Styles.textStyle16W400.copyWith(color: const Color(0xFF333333)),),
                const SizedBox(height: 30,),
                DefaultTextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  validation: (value){

                  },
                  fieldName: 'رقم الهاتف',
                  suffixIcon: Icons.call_outlined,
                ),
                const SizedBox(height: 26,),
                DefaultButton(
                  function: (){
                    GoRouter.of(context).push(AppRouters.kOtpScreen);
                  },
                  text: ' متابعة',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
