import 'package:bloc/bloc.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/dio_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'features/organization_membership/select_the_company/cubit/cubit.dart';


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
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
          )
        ),
        routerConfig: AppRouters.router,
        title: 'EDHP',
      ),
    );
  }
}
