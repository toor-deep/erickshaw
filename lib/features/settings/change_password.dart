import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design-system/styles.dart';
import '../../shared/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isObscureCurrent = true;
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Stack(
        children: [

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.85.sh,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50.0), // Adjust radius as needed
                ),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(top: 40,left: 16,right: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        style: TextStyles.textFormFieldDefaultStyle_14,
                        controller: _currentPasswordController,
                        obscureText: _isObscureCurrent,
                        decoration: InputDecoration(
                          floatingLabelStyle: const TextStyle(color: Colors.black),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black)
                          ),
                          labelText: 'Current Password',
                          suffixIcon: IconButton(
                            icon: Icon(_isObscureCurrent
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscureCurrent = !_isObscureCurrent;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your current password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        style: TextStyles.textFormFieldDefaultStyle_14,
                        controller: _newPasswordController,
                        obscureText: _isObscureNew,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscureNew
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscureNew = !_isObscureNew;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        style: TextStyles.textFormFieldDefaultStyle_14,
                        controller: _confirmPasswordController,
                        obscureText: _isObscureConfirm,
                        decoration: InputDecoration(
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscureConfirm
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscureConfirm = !_isObscureConfirm;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      Spacing.hlg,
                      SizedBox(
                        width: double.infinity,
                        height: 0.06.sh,
                        child: ElevatedButton(
                          onPressed:() {

                          },
                          child:  const Text('Change Password'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
