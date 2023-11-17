import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/call_center/call_center_screen.dart';
import 'package:edhp/features/home/home_screen.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/features/medical_file/medical_file_screen.dart';
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

  GetUserProfile ? getUserProfileModel;
  Future getProfile() async{
    emit(GetProfileLoadingState());
    await DioHelper.getData(
      path: EndPoint.getProfile ,
      token: token,
    ).then((value) {
      print(value.data);
      getUserProfileModel = GetUserProfile.fromJson(value.data);
      print(getUserProfileModel);
      emit(GetProfileSuccessfullyState());
    }).catchError((error) {
      emit(GetProfileErrorState());
    });
  }
}