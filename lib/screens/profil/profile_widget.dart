import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Container(
                                height: 120,
                                width: 120,
                                margin:const EdgeInsets.only(top: 80),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(100),
                                  color:const Color(0xff282B35),
                                  image: const DecorationImage(image: AssetImage("assets/IMG-20230320-WA0016.jpg"))
                                ),
                              ),
    );
  }
}
