
import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coach_nearest/layout/home_screen.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {

  static const String routeName = "Splash_Screen";

  const Splash_Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREEN_BACKGROUND,
      child: Column(
        children: [
          Expanded(
            flex:3,
            child: AnimatedSplashScreen(
              splash: Column(
                children: [
                  Expanded(child: Image.asset("assets/images/img/logo.png")),
                  
                  
                  Expanded(child: LottieBuilder.asset("assets/images/img/splashscreen/todo2.json")),
                ],
              ),
              nextScreen: HomeScreen(),
              backgroundColor: GREEN_BACKGROUND,
              splashIconSize: 500,
              duration: 4000,
              splashTransition: SplashTransition.fadeTransition,
              // pageTransitionType: PageTransitionType.leftToRight,
              animationDuration: Duration(seconds: 3),
            ),
          ),
           // Expanded(flex:2,child: ),
          Expanded(flex:1,child: Image.asset("assets/images/img/route.png"))
        ],
      ),
    );
  }
}
