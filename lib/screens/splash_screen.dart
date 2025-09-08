import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/screens/sign%20options/sign_in.dart';
import 'package:to_do_list/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _asyncMethod();
  }

  Future<void> _asyncMethod() async {
    await Future.delayed(Duration(seconds: 2));
    await Hive.initFlutter();
    await Hive.openBox("users");
    await Hive.openBox("currentUser");
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: Image.asset(AssetHelper.mainImage)),
    );
  }
}
