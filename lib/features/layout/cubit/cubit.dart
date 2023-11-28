import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/call_center/call_center_screen.dart';
import 'package:edhp/features/home/home_screen.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/features/medical_file/medical_file_screen.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/settings/settings_screen.dart';
import 'package:edhp/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_paths.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 3;
  List<Widget> screens = [
    const SettingScreen(),
    const CallCenterScreen(),
    const MedicalFileScreen(),
    const HomeScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.settingsIconSvg ,),
      label: 'الاعدادات',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
      label: 'خدمة العملاء',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
      label: 'الملف الطبي',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.homeIconSvg , color: AppColors.primaryBlueColor,),
      label: 'الرئيسية',
    ),
  ];

  void changeBottomIndex(int index){
    currentIndex = index;
    if(index == 3){
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg ),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg , color: AppColors.primaryBlueColor,),
          label: 'الرئيسية',
        ),
      ];
    }else if(index ==2){
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg ,),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg,  color: AppColors.primaryBlueColor,),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg ,),
          label: 'الرئيسية',
        ),
      ];
    }else if(index ==1){
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg ,),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg ,  color: AppColors.primaryBlueColor,),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg ,),
          label: 'الرئيسية',
        ),
      ];
    }else{
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg , color: AppColors.primaryBlueColor,),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg ,),
          label: 'الرئيسية',
        ),
      ];
    }
    emit(ChangeBottomNavigationBarState());
  }

  bool switchOfNotification = true;
  void changeSwitchOfNotification(bool value){
    switchOfNotification = value;
    emit(ChangeNotificationSettingsState());
  }

  bool switchOfFingerPrint = true;
  void changeSwitchOfFingerPrint(bool value){
    switchOfFingerPrint = value;
    emit(ChangeFingerPrintUponLoginSettingsState());
  }

  bool isArabic = true;
  void changeLanguage(bool value){
    isArabic = value;
    emit(ChangeLanguageSettingsState());
  }

  Future getProfile(BuildContext context) async {
    emit(GetProfileLoadingState());
    await DioHelper.getData(
      path: EndPoint.getProfile ,
      token: token,
    ).then((value) {
      print(value.data);
      GetProfileCubit.get(context).userProfileModel = GetUserProfile.fromJson(value.data);
      print(GetProfileCubit.get(context).userProfileModel!.userName);
      emit(GetProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }

  List<String> adsImage = [
    'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22220740/auto-draft-1317-1024x683.jpg',
    'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22220827/auto-draft-1320-1024x683.jpg',
    'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22221000/auto-draft-1326-1024x683.jpg',
    'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22221000/auto-draft-1326.jpg',
    'https://elements-cover-images-0.imgix.net/ba74bcfa-aa7c-43e6-b726-2bba7733d5fb?auto=compress%2Cformat&w=1370&fit=max&s=f2de7d383a6ab16de8dd4ebf90382d68'
  ];
  Random random = Random();
  int ? index = 1;
  void changeAdsImageRightIcon(){
    index = random.nextInt(adsImage.length);
    emit(ChangeAdsImage());
  }
}