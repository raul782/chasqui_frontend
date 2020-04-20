import 'package:chasqui_frontend/screens/common/responsive.dart';
import 'package:flutter/material.dart';

import 'large_screen.dart';
import 'small_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}
