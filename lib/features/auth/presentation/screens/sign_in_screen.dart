import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:erickshawapp/shared/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import '../../../../design-system/styles.dart';
import '../../../../shared/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.bg,
                  alignment: Alignment.centerRight,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 0.6.sh,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0), // Adjust radius as needed
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 50, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacing.hlg,
                        const Text(
                          'Welcome Back, We are happy to have you back',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacing.hlg,
                        Spacing.hlg,
                        Spacing.hlg,
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (String value) {
                            context.read<SignInCubit>().emailChanged(value);
                          },
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            errorText: state.emailStatus == EmailStatus.invalid
                                ? 'Invalid email'
                                : null,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Spacing.hlg,
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            errorText:
                                state.passwordStatus == PasswordStatus.invalid
                                    ? 'Invalid password'
                                    : null,

                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onChanged: (String value) {
                            context.read<SignInCubit>().passwordChanged(value);
                          },
                        ),
                        Spacing.hlg,
                        SizedBox(
                          width: double.infinity,
                          height: 0.06.sh,
                          child: ElevatedButton(
                            onPressed:
                                context.read<SignInCubit>().state.formStatus ==
                                        FormStatus.submissionInProgress
                                    ? null
                                    : () {
                                        context.read<SignInCubit>().signIn(() {
                                          Navigator.pushNamed(context, '/Home');
                                          setState(() {

                                          });
                                          emailController.clear();
                                          passwordController.clear();
                                        });
                                      },
                            child: state.isLoading == true
                                ? const CircularProgressIndicator()
                                : const Text('Sign In'),
                          ),
                        ),
                        Spacing.hlg,
                        Center(
                          child: Text(
                            'Or',
                            style: TextStyles.title1.copyWith(color: Colors.white),
                          ),
                        ),
                        Spacing.hlg,
                        SizedBox(
                          width: double.infinity,
                          height: 0.05.sh,
                          child: SignInButton(
                            Buttons.Google,
                            onPressed: () {
                                context.read<SignInCubit>().signInWithGoogle((){
                                  Navigator.pushNamed(context, '/Home');
                                });
                            },
                          ),
                        ),
                        Spacing.hlg,
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Don\'t have an account ? ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/SignUp');
                                    },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
