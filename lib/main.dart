import 'package:bloc/bloc.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/cache_helper.dart';
import 'core/network/dio_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'features/organization_membership/select_the_company/cubit/cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // bool ? rememberMe = await CacheHelper.getData(key: 'rememberMe');
  token = await CacheHelper.getData(key: 'token');
  // print(rememberMe);
  print(token);
  runApp(MyApp(
    // rememberMe: rememberMe,
    accessToken: token,));
}

class MyApp extends StatelessWidget {
  // bool ? rememberMe;
  String ? accessToken;
  MyApp({
    // required this.rememberMe ,
    required this.accessToken ,super.key});

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
        routerConfig: (accessToken == null)? AppRouters.baseRouter : AppRouters.skipLoginRouter,
        title: 'EDHP',
      ),
    );
  }
}
