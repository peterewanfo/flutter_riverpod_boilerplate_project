import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/custom_designs/responsive_layout.dart';

import 'signup_mobile_view.dart';
import 'signup_tablet_view.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SignupMobileView(),
      tablet: SignupTabletView(),
    );
  }
}
