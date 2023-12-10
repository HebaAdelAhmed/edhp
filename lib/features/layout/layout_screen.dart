import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getNewAccessToken(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          if(state is ChangeBottomNavigationBarState){
            GetProfileCubit.get(context).getProfile();
          }
        },
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: cubit.bottomNavigationBarItems,
                selectedItemColor: AppColors.primaryBlueColor,
                unselectedItemColor: AppColors.lightGrayColor,
                onTap: (index){
                  cubit.changeBottomIndex(index);
                },
                currentIndex: cubit.currentIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
