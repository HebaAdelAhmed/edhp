import 'package:flutter/material.dart';

import '../../../core/utils/styles/styles.dart';

class ConfirmDataFieldAndValueItem extends StatelessWidget {
  const ConfirmDataFieldAndValueItem({super.key, required this.field, required this.value});
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Text(value , style: Styles.textStyle16W400, textAlign: TextAlign.end,),
            ),
            Expanded(
              flex: 2,
              child: Text(field , style: Styles.textStyle20W500, textAlign: TextAlign.end,),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
