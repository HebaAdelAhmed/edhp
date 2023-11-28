import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/styles/styles.dart';

class MedicalFileContainerItem extends StatelessWidget {
  const MedicalFileContainerItem({super.key, required this.mainText, required this.value, required this.iconPath});

  final String mainText;
  final String value;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(mainText , style: Styles.textStyle12W400,),
            Text(value , style: Styles.textStyle12W400,),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(iconPath ,width: 40,),
      ],
    );
  }
}
