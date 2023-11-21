import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/features/drawer/drawer_components.dart';
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
            if(state is GetProfileSuccessfullyState) {
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
            } else{
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
