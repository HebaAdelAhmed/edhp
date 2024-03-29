import 'package:flutter/material.dart';
import '../../../../../core/utils/app_paths.dart';
import 'clickable_register_app_container_item.dart';

class RowOfRegisterApps extends StatelessWidget {
  const RowOfRegisterApps({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClickableRegisterAppContainerItem(appLogoPath: AppPaths.facebookLogoPath,),
        ClickableRegisterAppContainerItem(appLogoPath: AppPaths.googleLogoPath),
        ClickableRegisterAppContainerItem(appLogoPath: AppPaths.appleLogoPath),
      ],
    );
  }
}
