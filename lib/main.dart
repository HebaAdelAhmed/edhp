import 'package:bloc/bloc.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/edit_profile/edit_profile_screen.dart';
import 'package:edhp/features/layout/layout_screen.dart';
import 'package:edhp/features/login/login_screen.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/select_the_company/cubit/cubit.dart';
import 'package:edhp/features/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/dio_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'features/create_membership/create_membership_screen.dart';
import 'features/membership_data/membership_data_screen.dart';
import 'features/payment/payment_screen.dart';
import 'features/select_the_company/select_the_company_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompanyItemCubit()..getOrganizations(),
        ),
        BlocProvider(
          create: (context) => GetProfileCubit()..getProfile(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
        ),
        routerConfig: AppRouters.router,
        title: 'EDHP',
      ),
    );
  }
}
