import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../design-system/styles.dart';
import '../../../shared/app_images.dart';
import '../../../shared/constants.dart';
import '../../drawer.dart';
import 'home_screen.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;

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
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Ride',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white)),
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
                            AppImages.erickshaw,
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
                              const Text(
                                "PickUp Location",
                              ),
                              Text(
                                startLocation ?? "",
                              ),
                              Spacing.hmed,
                              const Text(
                                "Destination Location",
                              ),
                              Text(
                                endLocation ?? "",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacing.hmed,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                      ),
                      Text(
                        "\$40",
                      ),
                    ],
                  ),
                  Spacing.hmed,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                      ),
                      Text(
                        "\$4",
                      ),
                    ],
                  ),
                  Spacing.hlg,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                      ),
                      Text(
                        "\$44",
                      ),
                    ],
                  ),
                  const Spacer(),
                  Spacing.hmed,
                  SizedBox(
                    width: double.infinity,
                    height: 0.06.sh,
                    child: ElevatedButton(
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
