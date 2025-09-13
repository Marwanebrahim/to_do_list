import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/screens/home_screen.dart';
import 'package:to_do_list/screens/sign%20options/sign_in.dart';
import 'package:to_do_list/service/user_service.dart';
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
    UserService userService = UserService();
    await Future.delayed(Duration(seconds: 3));
    await Hive.initFlutter();
    await Hive.openBox("users");
    await Hive.openBox("currentUser");
    await Hive.openBox("tasks");
    var isUSerFound = await userService.getCurrentUser();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isUSerFound == null
              ? SignIn()
              : BlocProvider(
                  create: (context) => GetTaskCubit()..getTask(),
                  child: HomeScreen(),
                ),
        ),
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
