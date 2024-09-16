import 'package:erickshawapp/design-system/app_colors.dart';
import 'package:erickshawapp/shared/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design-system/styles.dart';
import '../drawer.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: CustomDrawer(),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      title: Text("Dark Mode",
                          style: TextStyles.textFormFieldDefaultStyle_14),
                      activeColor: kPrimaryColor,
                      value: isDarkMode,
                      onChanged: (value) {
                        isDarkMode = value;
                        setState(() {});
                      },
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/ChangePassword');
                      },
                      title: Text(
                        "Change Password",
                        style: TextStyles.textFormFieldDefaultStyle_14,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        showDeleteDialog(context: context);
                      },
                      title: Text(
                        "Delete Account",
                        style: TextStyles.textFormFieldDefaultStyle_14,
                      ),
                      trailing: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
