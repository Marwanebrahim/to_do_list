import 'package:flutter/material.dart';
import 'package:to_do_list/helper/asset_helper.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AssetHelper.mainImage),
    );
  }
}