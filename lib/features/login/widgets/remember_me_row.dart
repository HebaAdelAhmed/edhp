import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components/widgets/default_text_button.dart';
import '../../../../core/utils/styles/styles.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultTextButton(
          function: (){
            GoRouter.of(context).push(AppRouters.kForgetPasswordScreen);
          },
          text: 'نسيت كلمة السر؟' ,
          textColor: AppColors.primaryBlueColor,
        ),
        const Spacer(),
        Text('تذكرني' , style: Styles.textStyle14W400.copyWith(color: AppColors.lightGrayColor),),
        const SizedBox(
          width: 18,
        ),
        InkWell(
          onTap: (){

          },
          child: Stack(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                        color: AppColors.lightGrayColor,
                        width: 1
                    )
                ),
              ),
              const Icon(Icons.check , color: AppColors.lightGrayColor, size: 18,)
            ],
          ),
        )
      ],
    );
  }
}
