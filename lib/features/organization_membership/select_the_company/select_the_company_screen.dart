import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paths.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SelectTheCompanyScreen extends StatelessWidget {
  SelectTheCompanyScreen({super.key});

  TextEditingController notationIdController = TextEditingController();
  TextEditingController clubNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int ? organizationID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyItemCubit, CompanyItemsStates>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              children: [
                const BackCustomAppBar(),
                const SizedBox(
                  height: 40,
                ),
                const Text('اختر الشركه التابع لها' , style: Styles.textStyle20W500,),
                const SizedBox(
                  height: 40,
                ),
                if(state is CompanyItemLoadingState)
                  const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , crossAxisSpacing: 20),
                    itemBuilder: (_, index) => InkWell(
                      onTap: (){
                        organizationID = CompanyItemCubit.get(context).organizationItemsList[index].iD;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.lightGrayColor,
                                  blurRadius: 1,
                                ),
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                Image.asset(AppPaths.companyImage),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(CompanyItemCubit.get(context).organizationItemsList[index].name.toString() , style: Styles.textStyle16W400,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: CompanyItemCubit.get(context).organizationItemsList.length,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightGrayColor,
                          blurRadius: 1,
                        ),
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DefaultTextFormFieldWithoutLabel(
                                  controller: notationIdController,
                                  keyboardType: TextInputType.number,
                                  validation: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter your notation ID';
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const Expanded(flex: 2,child: Text('الرقم القومي' , style: Styles.textStyle16W500, textAlign: TextAlign.end,))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DefaultTextFormFieldWithoutLabel(
                                  controller: clubNumberController,
                                  keyboardType: TextInputType.number,
                                  validation: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter your club number';
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const Expanded(flex: 2,child: Text('رقم النادي' , style: Styles.textStyle16W500, textAlign: TextAlign.end,))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                            function: (){
                              if(formKey.currentState!.validate()){
                                CompanyItemCubit.get(context).validateOrganizationMember(
                                  // organizationId: organizationID!,
                                  identityNumber: notationIdController.text.trim().toString(),
                                  organizationMembershipNumber: int.parse(clubNumberController.text.trim().toString()),
                                ).then((value) {
                                  GoRouter.of(context).push(AppRouters.kOrganizationSubscriptionScreen);
                                });
                              }
                            },
                            text: 'تحقق',
                          ),
                          if(state is ValidateOrganizationMemberLoadingState)
                            const SizedBox(height: 15),
                          if(state is ValidateOrganizationMemberLoadingState)
                            const CircularProgressIndicator(color: AppColors.primaryBlueColor,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
              ],
            ),
          ),
        ),
      );
     },
    );
  }
}
