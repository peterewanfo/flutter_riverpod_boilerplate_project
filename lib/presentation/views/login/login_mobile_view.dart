import 'package:flutter/material.dart';

class LoginMobileView extends StatefulWidget {
  @override
  State<LoginMobileView> createState() => _LoginMobileViewState();
}

class _LoginMobileViewState extends State<LoginMobileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Login Mobile View"),
      ),
    );
  }
}
