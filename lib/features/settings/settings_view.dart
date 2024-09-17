import 'package:erickshawapp/shared/dialog.dart';
import 'package:erickshawapp/shared/state/app-theme/app_theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  late ThemeCubit themeCubit;

  @override
  void initState() {
    themeCubit = context.read<ThemeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
              centerTitle: true,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            drawer: CustomDrawer(),
            body: Stack(children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Theme.of(context).primaryColor,
              ),
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
                    padding:
                        const EdgeInsets.only(left: 30, top: 50, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SwitchListTile(
                          title: Text("Dark Mode",
                              style: Theme.of(context).textTheme.bodyMedium),
                          activeColor: Theme.of(context).primaryColor,
                          activeTrackColor: Colors.grey,
                          value: state.isDarkMode,
                          onChanged: (value) {
                            themeCubit.toggleTheme();
                            isDarkMode = value;
                            setState(() {});
                          },
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/ChangePassword');
                          },
                          title: Text("Change Password",
                              style: Theme.of(context).textTheme.bodyMedium),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            showDeleteDialog(context: context, onTap: () {});
                          },
                          title: Text("Delete Account",
                              style: Theme.of(context).textTheme.bodyMedium),
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
      },
    );
  }
}
