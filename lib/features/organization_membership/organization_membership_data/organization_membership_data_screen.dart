import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/membership_data/widgets/membership_text_form_field.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/cubit.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:edhp/features/organization_membership/select_the_company/cubit/cubit.dart';
import 'package:edhp/models/validate_organization_member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import '../../membership_data/widgets/custom_step_one_app_bar.dart';


class OrganizationMembershipDataScreen extends StatelessWidget {
  OrganizationMembershipDataScreen({super.key});

  TextEditingController identityNumberController = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  List<String> genderItems = [
    'ذكر',
    'انثى',
  ];
  String? genderSelectedValue;
  String ? governorateSelectedValue;
  final governorateItem = [
    'Cairo',
    'Alexandria',
    'Porsaid',
    'Suez',
    'Domiat',
    'Daqahlia',
    'Sharqia',
    'Qalubia',
    'Kafr Elshaikh',
    'Elgharbia',
    'Monofia',
    'Buhaira',
    'Esmailia',
    'Giza',
    'Bani Suef',
    'Fayoum',
    'Menia',
    'Matrouh',
  ];
  String? maritalStatusSelectedValue;
  TextEditingController region = TextEditingController();
  TextEditingController address = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizationMembershipDataCubit, OrganizationMembershipDataStates>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {

      OrganizationMembershipDataCubit cubit = OrganizationMembershipDataCubit.get(context);
      birthDate.text = cubit.selectedBirthDate != null ? '${cubit.selectedBirthDate!.year} / ${cubit.selectedBirthDate!.month} / ${cubit.selectedBirthDate!.day}' : '';

      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomStepOneAppBar(),
                  const Text('بيانات عضوية الشركة' , style: Styles.textStyle20W500,),
                  const SizedBox(
                    height: 40,
                  ),
                  MembershipTextFormField(
                    validation: (value){},
                    controller: identityNumberController,
                    textInputType: TextInputType.text,
                    nameOfField: 'الرقم القومي',
                    isClickable: false,
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
                                'اختار المحافظة',
                                // subscriptionInfoDTOModel.gender == 1 ? 'ذكر' : 'انثى',
                                style: Styles.textStyle14W400,
                              ),
                            ),
                            items: governorateItem
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
                              governorateSelectedValue = value.toString();
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
                      const Expanded(flex: 1,child: Text('المحافظة' , style: Styles.textStyle16W500, textAlign: TextAlign.end,)),
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
                                'اختار نوع جنسك',
                                // subscriptionInfoDTOModel.gender == 1 ? 'ذكر' : 'انثى',
                                style: Styles.textStyle14W400,
                              ),
                            ),
                            items: genderItems
                                !.map((item) => DropdownMenuItem<String>(
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
                    validation: (value){},
                    controller: region,
                    textInputType: TextInputType.text,
                    nameOfField: 'المنطقة',
                    isClickable: false,
                  ),
                  MembershipTextFormField(
                    validation: (value){},
                    controller: address,
                    textInputType: TextInputType.text,
                    nameOfField: 'العنوان',
                    isClickable: false,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          OrganizationMembershipDataCubit.get(context).selectBirthDate(context);
                        },
                        icon: SvgPicture.asset(AppPaths.dateIconSvg),
                      ),
                      Expanded(
                        flex: 6,
                        child: DefaultTextFormFieldWithoutLabel(
                          controller: birthDate,
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
                              OrganizationMembershipDataCubit.get(context).getNationalIDImageFromGallery();
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height/9,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              OrganizationMembershipDataCubit.get(context).getPersonalImageFromGallery();

                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height/9,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      OrganizationMembershipDataCubit.get(context).getOrganizationCardFromGallery ();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/9,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppPaths.notationIdIconSvg),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('قم برفع صورة كارنية العضوية للمؤسسة' , style: Styles.textStyle10W400,)
                          ],
                        ),
                      ),
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
);
  }
}
