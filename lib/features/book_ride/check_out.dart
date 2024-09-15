import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design-system/styles.dart';
import '../../shared/app_images.dart';
import '../../shared/constants.dart';
import '../drawer.dart';
import 'home_screen.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;


    final VehicleType? vehicle = args?['vehicle'] as VehicleType?;
    final String? startLocation = args?['startLocation'] as String?;
    final String? endLocation = args?['endLocation'] as String?;
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
      ),
      drawer: CustomDrawer(),
      body: Stack(children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Ride',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
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
            height: 0.82.sh,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50.0), // Adjust radius as needed
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 0.15.sh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            vehicle == VehicleType.auto
                                ? AppImages.logo
                                : AppImages.rickshaw,
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Spacing.wmed,
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PickUp Location",
                                style: TextStyles.textFormFieldDefaultStyle_14
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(startLocation??"",
                                  style:
                                      TextStyles.textFormFieldDefaultStyle_14),
                              Spacing.hmed,
                              Text(
                                "Destination Location",
                                style: TextStyles.textFormFieldDefaultStyle_14
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(endLocation??"",
                                  style:
                                      TextStyles.textFormFieldDefaultStyle_14),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacing.hmed,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyles.title1.copyWith(color: Colors.black),
                      ),
                      Text(
                        "\$40",
                        style: TextStyles.title1.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  Spacing.hmed,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: TextStyles.title1.copyWith(color: Colors.black),
                      ),
                      Text(
                        "\$4",
                        style: TextStyles.title1.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  Spacing.hlg,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyles.title1.copyWith(color: Colors.black),
                      ),
                      Text(
                        "\$44",
                        style: TextStyles.title1.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Spacing.hmed,
                  SizedBox(
                    width: double.infinity,
                    height: 0.06.sh,
                    child: ElevatedButton(
                      style: ButtonStyles.blackbg,
                      onPressed: () {
                        Navigator.pushNamed(context, '/Payment');
                      },
                      child: const Text('CheckOut'),
                    ),
                  ),
                  Spacing.hlg,
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
