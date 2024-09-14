import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class TermsAndCoditions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('My Terms'),
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
    );
  }

}