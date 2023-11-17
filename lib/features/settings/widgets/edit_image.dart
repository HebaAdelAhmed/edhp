import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paths.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(AppPaths.image, fit: BoxFit.cover,),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                color: AppColors.primaryBlueColor,
                borderRadius: BorderRadius.circular(5.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppPaths.editIconSvg,),
            ),
          )
        ],
      ),
    );
  }
}
