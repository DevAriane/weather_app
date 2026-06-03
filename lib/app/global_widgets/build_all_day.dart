import 'package:flutter/material.dart';
import './build_day.dart';

class BuildAllDay extends StatelessWidget {
  const BuildAllDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tomorrow's temperature", style: TextStyle(fontSize: 15)),
            SizedBox(height: 5),
            Text("Almost equal to today", style: TextStyle(fontSize: 10)),
            SizedBox(height: 10),
            BuildDay(),
          ],
        ),
      ),
    );
  }
}
