import 'package:flutter/material.dart';

import 'body.dart';

class TakeLook extends StatelessWidget {
  const TakeLook({Key? key}) : super(key: key);
  static String routeName = '/TakeLook';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyTakeALook(),
    );
  }
}
