import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_paths.dart';
import '../confirm_membership_data/widgets/confirm_data_field_and_value_item.dart';
import 'cubit/get_profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit, GetProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        GetProfileCubit cubit = GetProfileCubit.get(context);
        if(state is GetProfileSuccessfullyState) {
          return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0 , horizontal: 16),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(AppPaths.image, fit: BoxFit.cover, ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  ConfirmDataFieldAndValueItem(field: 'الإسم', value: cubit.userProfileModel!.profileName!.toString()),
                  ConfirmDataFieldAndValueItem(field: 'اسم المستخدم', value: cubit.userProfileModel!.userName!.toString()),
                  ConfirmDataFieldAndValueItem(field: 'رقم الهاتف', value: cubit.userProfileModel!.mobileNumber!.toString()),
                  ConfirmDataFieldAndValueItem(field: 'البريد الالكتروني', value: cubit.userProfileModel!.email!.toString()),
                  ConfirmDataFieldAndValueItem(field: 'الرقم القومي', value: cubit.userProfileModel!.identityNumber!.toString()),
                  ConfirmDataFieldAndValueItem(field: 'الجنس', value: cubit.userProfileModel!.gender! == 1 ? 'ذكر' : 'انثى'),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        );
        } else if(state is GetProfileLoadingState) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryBlueColor,),
              ),
            ),
          );
        }
        return const Scaffold(
            body: SafeArea(
              child: Column(),
            ),
        );
      },
    );
  }
}