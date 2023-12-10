import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/drawer/drawer_components.dart';
import 'package:edhp/features/home/widgets/medical_file_container_items.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getProfile(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is GetProfileSuccessfullyState || state is ChangeAdsImage || state is GetProfileImageSuccessfullyState) {
              return Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: AppColors.blackColor),
                backgroundColor: AppColors.whiteColor,
                elevation: 0,
                centerTitle: true,
                title: SvgPicture.asset(AppPaths.logoPath , width: 90,),
                leading: IconButton(
                  onPressed: (){

                  },
                  icon: SvgPicture.asset(AppPaths.notificationIconSvg),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.network(LayoutCubit.get(context).adsImage[LayoutCubit.get(context).index!] , fit: BoxFit.cover,),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: (){
                                  LayoutCubit.get(context).changeAdsImageRightIcon();
                                },
                                icon: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.whiteColor, size: 40,),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: (){
                                  LayoutCubit.get(context).changeAdsImageRightIcon();
                                },
                                icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor, size: 40,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('التصنيفات' , style: Styles.textStyle20W500,)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Image.asset(AppPaths.product01),
                          ),
                          InkWell(
                            child: Image.asset(AppPaths.product02),
                            onTap: (){},
                          ),
                          InkWell(
                            child: Image.asset(AppPaths.product03),
                            onTap: (){},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(AppPaths.medicalProfileFileIconSvg,),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('ملفك الطبي' , style: Styles.textStyle20W500,),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.boxesColor,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text('رقم الملف : 123456' , style: Styles.textStyle16W500,),
                              const SizedBox(
                                height: 15,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MedicalFileContainerItem(mainText: 'الفصيلة', value: 'A+', iconPath: AppPaths.bloodTypeIcon),
                                  MedicalFileContainerItem(mainText: 'الجنس', value: 'ذكر', iconPath: AppPaths.genderIcon),
                                  MedicalFileContainerItem(mainText: 'العمر', value: '25', iconPath: AppPaths.ageIcon),
                                ],
                              ),
                              TextButton(
                                onPressed: (){

                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.arrow_back_ios , color: AppColors.primaryBlueColor, size: 15,),
                                    Text(
                                      'المزيد',
                                      style: TextStyle(
                                          color: AppColors.primaryBlueColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontFamily: 'Tajawal'
                                      ),
                                    ),
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              endDrawer: Drawer(
                child: Column(
                  children: [
                    DrawerAppHeader(
                      image: AppPaths.image,
                      name: GetProfileCubit.get(context).userProfileModel!.profileName.toString(),
                      username: GetProfileCubit.get(context).userProfileModel!.userName.toString(),
                    ),
                    const DrawerAppList(),
                    const DrawerAppFooter()
                  ],
                ),
              ),
            );
            }
            else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: AppColors.primaryBlueColor,),
                ),
              );
            }
          },
        ),
    );
  }
}
