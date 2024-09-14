import 'package:erickshawapp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../design-system/styles.dart';

void showDeleteDialog({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title:  Text('Are you sure want to perform this action?',style: TextStyles.title1.copyWith(color: Colors.black),),
          content:  Text('Your data will be cleared',style: TextStyles.body1.copyWith(color: Colors.black),),
          actions: [
            FilledButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No',  style: TextStyle(color: Colors.black),))
          ],
        );
      });
}
