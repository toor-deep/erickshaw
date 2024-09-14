import 'package:cached_network_image/cached_network_image.dart';
import 'package:erickshawapp/design-system/app_colors.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_images.dart';
import '../shared/constants.dart';
import '../shared/dialog.dart';

class CustomDrawer extends StatelessWidget {
  late SignInCubit signInCubit;

  @override
  Widget build(BuildContext context) {
    signInCubit = context.read<SignInCubit>();
    return Drawer(
      width: 0.7.sw,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 0.23.sh,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        signInCubit.state.authUser?.photoURL != null &&
                                signInCubit.state.authUser!.photoURL!.isNotEmpty
                            ? CachedNetworkImageProvider(
                                signInCubit.state.authUser!.photoURL!)
                            : const AssetImage(AppImages.user),
                  ),
                  Spacing.hmed,
                  Text(
                    signInCubit.state.authUser?.name ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    signInCubit.state.authUser?.email ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bike_scooter),
            title: const Text('Rides'),
            onTap: () {
              Navigator.pushNamed(context, '/MyRides');
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: const Text('My Wallet'),
            onTap: () {
              Navigator.pushNamed(context, '/MyWallet');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/Settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Terms & Conditions'),
            onTap: () {
              Navigator.pushNamed(context, '/TermsAndConditions');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy'),
            onTap: () {
              Navigator.pushNamed(context, '/Privacy');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/MyProfile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () {
              Navigator.pop(context);
              showDeleteDialog(context: context);
            },
          ),
          // Add more items here
        ],
      ),
    );
  }
}
