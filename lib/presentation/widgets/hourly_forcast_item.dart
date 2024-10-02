// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color.fromARGB(255, 58, 55, 55),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(time, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
            Text(temperature, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
