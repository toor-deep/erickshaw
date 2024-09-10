import 'package:erickshawapp/shared/app_images.dart';
import 'package:erickshawapp/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(AppImages.logo)),
            Spacing.hmed,
            const Text(kAppName,
                style: TextStyle(color:Colors.pink,fontWeight: FontWeight.bold,fontSize: 40))
          ],
        ),
      ),
    );
  }
}
