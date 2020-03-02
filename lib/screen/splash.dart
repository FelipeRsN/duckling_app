import 'package:duckling/res/app_colors.dart';
import 'package:duckling/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _executeAfterBuild(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _buildSplashScreen(),
    );
  }

  Widget _buildSplashScreen() {
    return Container(
      color: AppColors.colorPrimary,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: SizedBox(
        width: 242,
        height: 220,
        child: Image.asset("assets/images/duckling_logo.png"),
      ),
    );
  }

  void _executeAfterBuild(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppConstants.route_intro);
    });
  }
}
