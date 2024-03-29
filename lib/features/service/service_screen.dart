import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/features/service/widgets/membership_type_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_components/widgets/back_custom_app_bar.dart';
import '../../core/utils/styles/styles.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OurProductCubit, OurProductStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        OurProductCubit cubit = OurProductCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                children: [
                   const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Spacer(),
                        Text('بطاقات العضويات' , style: Styles.textStyle20W500 , textAlign: TextAlign.center),
                        Spacer(),
                        BackCustomAppBar(),
                      ],
                    ),
                  ),
                  if(state is OurProductLoadingState)
                    const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => MembershipTypeContainer(
                          price: cubit.membershipTypeList[index].price.toString(),
                          name: cubit.membershipTypeList[index].name.toString(),
                          description: cubit.membershipTypeList[index].description.toString(),
                          index: index,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                        itemCount: cubit.membershipTypeList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
