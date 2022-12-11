

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class translateText extends StatelessWidget {
  translateText({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text.tr),
    );

  }
}
