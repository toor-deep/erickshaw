import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/app_images.dart';
import '../../shared/constants.dart';
import '../drawer.dart';

class MyRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,color: Colors.white,),
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
                Text('History',
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
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 0.02.sh,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 0.17.sh,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "10 Aug 2024",
                                        ),
                                        const Text(
                                          "Start Location",
                                        ),
                                        const Text("jhgf"),
                                        Spacing.hsm,
                                        const Text(
                                          "Destination Location",
                                        ),
                                        const Text(
                                          'jhgfdfj khgfd',
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacing.wmed,
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
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/CheckOut');
                                      },
                                      child: const Text("Book Again")),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                  Spacing.hmed,
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
