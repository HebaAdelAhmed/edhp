import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/features/edit_profile/cubit/cubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/settings/widgets/edit_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';
import 'cubit/state.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => EditProfileCubit(),
        ),
      ],
      child: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const BackCustomAppBar(),
                        const SizedBox(
                          height: 4,
                        ),
                        const EditImage(),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(GetProfileCubit.get(context).userProfileModel!.profileName.toString() , style: Styles.textStyle16W400,),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(AppPaths.editIconSvg , color: AppColors.primaryBlueColor, width: 12,),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(GetProfileCubit.get(context).userProfileModel!.userName.toString() , style: Styles.textStyle16W400,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        const Align(alignment: AlignmentDirectional.centerEnd,child: Text('الإسم' , style: Styles.textStyle16W500,),),
                        DefaultTextFormFieldWithoutLabel(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validation: (value){
                            if(value!.isEmpty){
                              return 'name must be not empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(alignment: AlignmentDirectional.centerEnd,child: Text('اسم المستخدم' , style: Styles.textStyle16W500,),),
                        DefaultTextFormFieldWithoutLabel(
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          validation: (value){
                            if(value!.isEmpty){
                              return 'username must be not empty';
                            }
                            return null;
                          },
                          prefixIcon: Icons.visibility_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(alignment: AlignmentDirectional.centerEnd,child: Text('الرقم القومي' , style: Styles.textStyle16W500,),),
                        DefaultTextFormFieldWithoutLabel(
                          controller: identityNumberController,
                          keyboardType: TextInputType.text,
                          validation: (value){
                            if(value!.isEmpty){
                              return 'identity number must be not empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(alignment: AlignmentDirectional.centerEnd,child: Text('البريد الالكتروني' , style: Styles.textStyle16W500,),),
                        DefaultTextFormFieldWithoutLabel(
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          validation: (value){
                            if(value!.isEmpty){
                              return 'email must be not empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(alignment: AlignmentDirectional.centerEnd,child: Text('رقم الهاتف' , style: Styles.textStyle16W500,),),
                        DefaultTextFormFieldWithoutLabel(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          validation: (value){
                            if(value!.isEmpty){
                              return 'phone number must be not empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        if(state is EditProfileLoadingState)
                          const CircularProgressIndicator(color: AppColors.primaryBlueColor,),
                        if(state is EditProfileLoadingState)
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                        DefaultButton(
                          function: (){
                            if(formKey.currentState!.validate()){
                              EditProfileCubit.get(context).editProfile(
                                  name: nameController.text,
                                  username: usernameController.text,
                                  mobileNumber: phoneNumberController.text,
                                  email: emailController.text,
                                  identityNumber: identityNumberController.text,
                              );
                            }
                          },
                          text: 'حفظ التغييرات' ,
                          redius: 10,
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
