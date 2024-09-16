import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design-system/styles.dart';
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
                  'History',
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
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 0.02.sh,),
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
                                    padding: const EdgeInsets.only(top: 20,left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "10 Aug 2024",
                                          style: TextStyles
                                              .textFormFieldDefaultStyle_14
                                              .copyWith(fontWeight: FontWeight.bold),
                                        ),

                                        Text(
                                          "Start Location",
                                          style: TextStyles
                                              .textFormFieldDefaultStyle_14
                                              .copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        Text("jhgf",
                                            style: TextStyles
                                                .textFormFieldDefaultStyle_14),
                                        Spacing.hsm,
                                        Text(
                                          "Destination Location",
                                          style: TextStyles
                                              .textFormFieldDefaultStyle_14
                                              .copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        Text('jhgfdfj khgfd',
                                            style: TextStyles
                                                .textFormFieldDefaultStyle_14),
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
                                padding:  EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:double.infinity,
                                  child: OutlinedButton(

                                  onPressed: () {
                                    Navigator.pushNamed(context,'/CheckOut');
                                  },
                                      child:  Text("Book Again")),
                                ),
                              )
                            ],
                          ),
                        );
                      }, itemCount: 10,
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
