import 'package:flutter/material.dart';

class LoginTabletView extends StatefulWidget {
  @override
  State<LoginTabletView> createState() => _LoginTabletViewState();
}

class _LoginTabletViewState extends State<LoginTabletView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Login Tablet View"),
      ),
    );
  }
}
