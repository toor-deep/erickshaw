import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:erickshawapp/design-system/app_colors.dart';
import 'package:erickshawapp/design-system/styles.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:erickshawapp/features/drawer.dart';
import 'package:erickshawapp/shared/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/constants.dart';

enum VehicleType { auto, rickshaw, none }

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SignInCubit signInCubit;
  VehicleType selectedVehicle = VehicleType.none;

  @override
  void initState() {
    signInCubit = context.read<SignInCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> destinations = [
      'Agira Hall',
      'Ambaram Hall',
      'Amritam Hall',
      'Ananta Hall',
      'Anantam Hall',
      'CS Cafe',
      'Hostel FR-F',
      'Hostel PG',
      'Neeram Hall',
      'Prithvi Hall',
      'Streat Cafe (Admin Block)',
      'Tejas Hall',
      'Vahni Hall',
      'Viyat Hall',
      'Vyan Hall',
      'Vyom Hall',
      'Waterbody Cafe (Library)'
    ];
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              backgroundImage: signInCubit.state.authUser?.photoURL != null &&
                      signInCubit.state.authUser!.photoURL!.isNotEmpty
                  ? CachedNetworkImageProvider(
                      signInCubit.state.authUser!.photoURL!)
                  : const AssetImage(AppImages.user), // Fallback image
              radius: 20.0, // Adjust radius as needed
            ),
          ),
          Spacing.hmed,
        ],
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${signInCubit.state.authUser?.name ?? "User"}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacing.hmed,
                  const Text("how are you ? hope you are doing great"),
                ],
              ),
            ),
          ),
          Spacing.hmed,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.8.sh,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: Paddings.contentPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        aspectRatio: 16 / 9,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: const Image(
                                  image: AssetImage(AppImages.bg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Spacing.hmed,
                    Text(
                      "Where you want to go ?",
                      style: TextStyles.title1.copyWith(color: Colors.black),
                    ),
                    Spacing.hmed,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 7, color: Colors.black),
                              ),
                            ),
                            const Dash(
                              direction: Axis.vertical,
                              length: 50,
                              dashLength: 6,
                              dashColor: Colors.black,
                            ),
                            const Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 40,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                startLocation(),
                                Spacing.hlg,
                                destination(destinations),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacing.hmed,
                    Text(
                      "Select Vehicle",
                      style: TextStyles.title1.copyWith(color: Colors.black),
                    ),
                    Spacing.hmed,
                    _selectVehicle(),
                    Spacing.hlg,
                    SizedBox(
                      width: double.infinity,
                      height: 0.06.sh,
                      child: ElevatedButton(
                        style: ButtonStyles.blackbg,
                        onPressed: () {},
                        child: const Text('Send Request'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget startLocation() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Start Location",
        floatingLabelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          // Black border when enabled
          borderRadius: BorderRadius.circular(5.0), // Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          // Black border when focused
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.black,
      value: null,
      items: ['Location 1', 'Location 2', 'Location 3', 'Location 4']
          .map((String location) {
        return DropdownMenuItem<String>(
          value: location,
          child: Text(
            location,
            style: TextStyles.textFormFieldDefaultStyle_14,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {},
    );
  }

  Widget destination(List<String> destinations) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "End Location",
        floatingLabelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          // Black border when enabled
          borderRadius: BorderRadius.circular(5.0), // Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          // Black border when focused
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      dropdownColor: Colors.white,
      // White background for the dropdown
      iconEnabledColor: Colors.black,

      value: null,
      items: destinations.map((String location) {
        return DropdownMenuItem<String>(
          value: location,
          child: Text(
            location,
            style: TextStyles
                .textFormFieldDefaultStyle_14, // Black text color for dropdown items
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Handle change
      },
    );
  }

  Widget _selectVehicle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedVehicle = selectedVehicle == VehicleType.auto
                  ? VehicleType.none
                  : VehicleType.auto;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedVehicle == VehicleType.auto
                  ? Colors.grey.shade200
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Auto",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Spacing.wlg,
        GestureDetector(
          onTap: () {
            setState(() {
              selectedVehicle = selectedVehicle == VehicleType.rickshaw
                  ? VehicleType.none
                  : VehicleType.rickshaw;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedVehicle == VehicleType.rickshaw
                  ? Colors.grey.shade200
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.rickshaw,
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Rickshaw",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
