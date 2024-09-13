import 'package:erickshawapp/shared/app_images.dart';
import 'package:erickshawapp/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'features/auth/presentation/bloc/sign_in/sign_in_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.authUser != null) {
          Navigator.pushReplacementNamed(context, '/Home');
        } else {
          Navigator.pushReplacementNamed(context, '/SignIn');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage(AppImages.logo)),
                Spacing.hmed,
                const Text(kAppName,
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
