import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../design-system/styles.dart';
import '../../../../shared/app_images.dart';
import '../../../../shared/constants.dart';
import '../bloc/sign_in/sign_in_state.dart';
import '../bloc/sign_up/sign_up_cubit.dart';
import '../bloc/sign_up/sign_up_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SignUpCubit, SignUpState>(
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
                    color: Colors.white,
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
                        Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Spacing.hlg,
                        Text(
                          'Create your account to start using RideMate',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Spacing.hlg,
                        Spacing.hlg,
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          onChanged: (String value) {
                            context.read<SignUpCubit>().emailChanged(value);
                          },
                          decoration: InputDecoration(
                            label: const Text('Email'),

                            errorText: state.emailStatus == EmailStatus.invalid
                                ? 'Invalid email'
                                : null,
                            labelStyle:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Spacing.hlg,
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            errorText:
                                state.passwordStatus == PasswordStatus.invalid
                                    ? 'Invalid password'
                                    : null,
                            labelStyle:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onChanged: (String value) {
                            context.read<SignUpCubit>().passwordChanged(value);
                          },
                        ),
                        Spacing.hlg,
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            label: const Text('Phone'),

                            labelStyle:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Spacing.hlg,
                        SizedBox(
                          width: double.infinity,
                          height: 0.06.sh,
                          child: ElevatedButton(
                            onPressed:
                                context.read<SignUpCubit>().state.formStatus ==
                                        FormStatus.submissionInProgress
                                    ? null
                                    : () {
                                        context.read<SignUpCubit>().signUp(() {
                                          Navigator.pushNamed(context, '/Home');
                                          emailController.clear();
                                          phoneNumberController.clear();
                                          passwordController.clear();
                                        });
                                      },
                            child: state.isLoading == true
                                ? const CircularProgressIndicator()
                                : const Text('Sign Up'),
                          ),
                        ),
                        Spacing.hlg,
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                 TextSpan(
                                  text: 'Already have an account ? ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: const TextStyle(color: Colors.teal),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/SignIn');
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
