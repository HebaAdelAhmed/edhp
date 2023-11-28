import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/network/end_point.dart';
import '../../core/utils/styles/styles.dart';

class DrawerAppHeader extends StatelessWidget {

  final String image;
  final String name;
  final String username;

  DrawerAppHeader({super.key, required this.image, required this.name, required this.username});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.26,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: (){
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.close , size: 28,),
              ),
            ),
          ),
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(EndPoint.getProfileImage(context), fit: BoxFit.cover,),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: DefaultButton(
              function: (){
                GoRouter.of(context).push(AppRouters.kProfileScreen);
              },
              text: 'الملف الشخصي' , height: 40,),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name , style: Styles.textStyle16W400,),
          const SizedBox(
            height: 5,
          ),
          Text(username , style: Styles.textStyle16W400,)
        ],
      ),
    );
  }
}

class ClickableDrawerItem extends StatelessWidget {

  final String text;
  final String svgIcon;
  final String pathLocationScreen;

  const ClickableDrawerItem({super.key, required this.text, required this.svgIcon, required this.pathLocationScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: InkWell(
        onTap: (){
          GoRouter.of(context).push(pathLocationScreen);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0 , bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(text , style: Styles.textStyle16W500,),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(svgIcon),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerAppList extends StatelessWidget {
  const DrawerAppList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ClickableDrawerItem(text: 'خدماتنا', svgIcon: AppPaths.serviceIconSvg , pathLocationScreen: AppRouters.kServiceScreen),
        SizedBox(
          height: 4,
        ),
        ClickableDrawerItem(text: 'العضويات', svgIcon: AppPaths.membershipIconSvg , pathLocationScreen: AppRouters.kCreateMembershipScreen),
        SizedBox(
          height: 4,
        ),
        ClickableDrawerItem(text: 'الشبكة الطبية', svgIcon: AppPaths.medicalNetworkIconSvg, pathLocationScreen: AppRouters.kMedicalNetworkScreen),
        SizedBox(
          height: 4,
        ),
        ClickableDrawerItem(text: 'السجل المرضي', svgIcon: AppPaths.medicalRecordIconSvg, pathLocationScreen: AppRouters.kMedicalRecordScreen),
      ],
    );
  }
}

class DrawerAppFooter extends StatelessWidget {
  const DrawerAppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              DefaultTextButton(text: 'سياسة الخصوصية', function: (){},),
              const Spacer(),
              DefaultTextButton(text: 'الشروط والأحكام', function: (){},),
            ],
          ),
        ),
        DefaultTextButton(text: 'Powered by commit', function: (){},),
      ],
    );
  }
}
