import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/membership_data/cubit/cubit.dart';
import 'package:edhp/features/membership_data/cubit/states.dart';
import 'package:edhp/features/membership_data/widgets/membership_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'widgets/custom_step_one_app_bar.dart';

class MembershipDataScreen extends StatelessWidget {
  MembershipDataScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController notationIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final List<String> genderItems = [
    'ذكر',
    'انثى',
  ];
  String? genderSelectedValue;
  final maritalStatusItem = [
    'أعزب',
    'متزوج',
    'مطلق',
    'ارمل',
  ];
  String? maritalStatusSelectedValue;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembershipDataCubit(),
      child: BlocConsumer<MembershipDataCubit, MembershipDataStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MembershipDataCubit cubit = MembershipDataCubit.get(context);
        birthDateController.text = cubit.selectedDate != null ?'${cubit.selectedDate!.year}/${cubit.selectedDate!.month}/${cubit.selectedDate!.day}' : '';
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomStepOneAppBar(),
                    const Text('بيانات العضوية' , style: Styles.textStyle20W500,),
                    const SizedBox(
                      height: 40,
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: nameController,
                      textInputType: TextInputType.text,
                      nameOfField: 'الاسم',
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: addressController,
                      textInputType: TextInputType.text,
                      nameOfField: 'العنوان',
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: jobController,
                      textInputType: TextInputType.text,
                      nameOfField: 'الوظيفة',
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.boxesColor,
                            ),
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration:  InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: SvgPicture.asset(AppPaths.downIconSvg,),
                                ),
                              ),
                              hint: const Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  'اختار جنسك',
                                  style: Styles.textStyle14W400,
                                ),
                              ),
                              items: genderItems
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                    item,
                                    style: Styles.textStyle14W400
                                  ),
                                ),
                              ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'من فضلك اختر نوع جنسك';
                                }
                                return null;
                              },
                              onChanged: (value) {
                              },
                              onSaved: (value) {
                                genderSelectedValue = value.toString();
                              },
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.boxesColor
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(flex: 1,child: Text('الجنس' , style: Styles.textStyle16W500, textAlign: TextAlign.end,)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: notationIdController,
                      textInputType: TextInputType.number,
                      nameOfField: 'الرقم القومي',
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: phoneNumberController,
                      textInputType: TextInputType.number,
                      nameOfField: 'رقم الهاتف',
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            MembershipDataCubit.get(context).selectDate(context);
                          },
                          icon: SvgPicture.asset(AppPaths.dateIconSvg),
                        ),
                        Expanded(
                          flex: 6,
                          child: DefaultTextFormFieldWithoutLabel(
                            controller: birthDateController,
                            keyboardType: TextInputType.text,
                            validation: (value){},
                            isClickable: false,
                          ),
                        ),
                        const Expanded(flex: 4,child: Text('تاريخ الميلاد' , style: Styles.textStyle16W500, textAlign: TextAlign.end,)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.boxesColor,
                            ),
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration:  InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: SvgPicture.asset(AppPaths.downIconSvg,),
                                ),
                              ),
                              hint: const Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  'حالتك الاجتماعية',
                                  style: Styles.textStyle14W400,
                                ),
                              ),
                              items: maritalStatusItem
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                      item,
                                      style: Styles.textStyle14W400
                                  ),
                                ),
                              ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'من فضلك اختر حالتك الاجتماعية';
                                }
                                return null;
                              },
                              onChanged: (value) {
                              },
                              onSaved: (value) {
                                maritalStatusSelectedValue = value.toString();
                              },
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.boxesColor
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(flex: 1,child: Text('الحالة الإجتماعية' , style: Styles.textStyle16W500, textAlign: TextAlign.end,)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      nameOfField: 'الرقم السري',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit.getNotationIdImageFromGallery();
                              },
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
                                      SvgPicture.asset(AppPaths.notationIdIconSvg),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text('قم برفع صورة بطاقة الرقم القومي' , style: Styles.textStyle10W400,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit.getProfileImageFromGallery();
                              },
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
                                      SvgPicture.asset(AppPaths.imageIconSvg),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text('قم برفع صورة لك' , style: Styles.textStyle10W400,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultButton(
                      function: (){
                        GoRouter.of(context).push(AppRouters.kConfirmMembershipDataScreen);
                      },
                      text: 'متابعة' ,
                      height: 45,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
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
