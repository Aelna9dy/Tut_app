import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(child: Text("On Boarding")),
    );
  }
}
