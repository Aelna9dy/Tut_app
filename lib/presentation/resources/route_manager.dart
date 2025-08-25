import 'package:advanced_flutter/presentation/forget_pass/forget_password.dart';
import 'package:advanced_flutter/presentation/login/login.dart';
import 'package:advanced_flutter/presentation/main/main_view.dart';
import 'package:advanced_flutter/presentation/on_boarding/on_boarding.dart';
import 'package:advanced_flutter/presentation/register/register.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/splash/splash.dart';
import 'package:advanced_flutter/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => Splash(),);
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => Login(),);
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => Register(),);
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (context) => ForgetPassword(),);
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => OnBoarding(),);
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => MainView(),);
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => StoreDetails(),);

      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (context) =>
      Scaffold(
        appBar: AppBar(title: Text(AppStrings.noRouteFound),),
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      )
    ,);
  }
}