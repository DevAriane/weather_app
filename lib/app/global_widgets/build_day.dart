import 'package:flutter/material.dart';
import '../core/constants/app_bar_color_constants.dart';

class BuildDay extends StatelessWidget {
  const BuildDay({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday'];

    return Column(
      children: days
          .map(
            (day) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day,
                    style: const TextStyle(
                      color: AppBarColorConstants.texte,
                      fontSize: 15,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.wb_cloudy_outlined,
                        color: Colors.blueGrey,
                        size: 20,
                      ),
                      SizedBox(width: 25),
                      Text(
                        '16°  27°',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
