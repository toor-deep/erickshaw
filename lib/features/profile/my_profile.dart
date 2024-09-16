import 'package:cached_network_image/cached_network_image.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design-system/styles.dart';
import '../../shared/app_images.dart';
import '../../shared/constants.dart';
import '../../shared/image_upload.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late SignInCubit signInCubit;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isUpdate = true;

  @override
  void initState() {
    super.initState();
    signInCubit = context.read<SignInCubit>();
    nameController.text = signInCubit.state.authUser?.name ?? "";
    emailController.text = signInCubit.state.authUser?.email ?? "";
    phoneController.text = signInCubit.state.authUser?.phone ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        fit: BoxFit.cover,
                        image: signInCubit.state.authUser?.photoURL != null &&
                                signInCubit.state.authUser!.photoURL!.isNotEmpty
                            ? CachedNetworkImageProvider(
                                signInCubit.state.authUser!.photoURL!)
                            : const AssetImage(AppImages.user) as ImageProvider,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showOptions(context: context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        Spacing.hmed,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 0.7.sh,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50.0), // Adjust radius as needed
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyles.title1.copyWith(color: Colors.black),
                    ),
                    Spacing.hmed,
                    TextFormField(
                      readOnly: isUpdate,
                      style: TextStyles.textFormFieldDefaultStyle_14,
                      controller: nameController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    Spacing.hlg,
                    Spacing.hlg,
                    Text(
                      'Email',
                      style: TextStyles.title1.copyWith(color: Colors.black),
                    ),
                    Spacing.hmed,
                    TextFormField(
                      readOnly: true,
                      style: TextStyles.textFormFieldDefaultStyle_14,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Spacing.hlg,
                    Spacing.hlg,
                    Text(
                      'Phone',
                      style: TextStyles.title1.copyWith(color: Colors.black),
                    ),
                    Spacing.hmed,
                    TextFormField(
                      readOnly: isUpdate,
                      style: TextStyles.textFormFieldDefaultStyle_14,
                      controller: phoneController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your phone';
                        }
                        return null;
                      },
                    ),
                    Spacing.hlg,
                    Spacing.hlg,
                    SizedBox(
                      width: double.infinity,
                      height: 0.06.sh,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isUpdate = !isUpdate;
                          });
                        },
                        child: Text(isUpdate ? 'Edit' : 'Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
