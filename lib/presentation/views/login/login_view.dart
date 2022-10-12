import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/custom_designs/responsive_layout.dart';

import 'login_mobile_view.dart';
import 'login_tablet_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LoginMobileView(),
      tablet: LoginTabletView(),
    );
  }
}
