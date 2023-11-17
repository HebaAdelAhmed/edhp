import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/features/drawer/drawer_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              name: loginModel!.resultObject!.profileName.toString(),
              username: loginModel!.resultObject!.userName.toString(),
            ),
            const DrawerAppList(),
            const DrawerAppFooter()
          ],
        ),
      ),
    );
  }
}
