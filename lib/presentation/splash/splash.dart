import 'dart:async';

import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../resources/route_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Timer? _timer;
  startDelay(){
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo)),
      ),
    );
  }
}
