import 'package:cached_network_image/cached_network_image.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:erickshawapp/features/auth/presentation/screens/sign_in_screen.dart';
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
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 0.23.sh,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: signInCubit.state.authUser?.photoURL !=
                                  null &&
                              signInCubit.state.authUser!.photoURL!.isNotEmpty
                          ? CachedNetworkImageProvider(
                              signInCubit.state.authUser!.photoURL!)
                          : const AssetImage(AppImages.user),
                    ),
                    Spacing.hmed,
                    Text(
                      signInCubit.state.authUser?.name ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(signInCubit.state.authUser?.email ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.bike_scooter,
                color: Colors.black,
              ),
              title: Text(
                'Rides',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/MyRides');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.wallet,
                color: Colors.black,
              ),
              title: Text(
                'My Wallet',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/MyWallet');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Settings');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book,
                color: Colors.black,
              ),
              title: Text(
                'Terms & Conditions',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/TermsAndConditions');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.security,
                color: Colors.black,
              ),
              title: Text(
                'Privacy',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Privacy');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'Profile',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/MyProfile');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                'Sign Out',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                showDeleteDialog(
                    context: context,
                    onTap: () {
                      signInCubit.signOut((){
                        Navigator.of(appNavigationKey.currentContext!).pushNamedAndRemoveUntil('/SignIn', (Route<dynamic> route) => false);
                      });
                    });
              },
            ),
            // Add more items here
          ],
        ),
      ),
    );
  }
}
