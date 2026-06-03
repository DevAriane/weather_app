import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/images_constants.dart';

class Temperature extends StatelessWidget {
  double temperature;
  double latitude;
  double longitude;
  String ville;
  Temperature({
    super.key,
    required this.temperature,
    required this.latitude,
    required this.longitude,
    required this.ville,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$temperature°C",
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "H: ${longitude.toStringAsFixed(0)}",
                      style: GoogleFonts.nunito(color: const Color(0xFFFFFFFF)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "L: ${latitude.toStringAsFixed(0)}",
                      style: GoogleFonts.nunito(color: const Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  ImagesConstants.location,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  ville,
                  maxLines: 2,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
