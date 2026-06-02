import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Color color;
  const MyAppBar({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: color);
  }
}
