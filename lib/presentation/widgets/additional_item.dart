// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {

  final IconData icon;
  final String weatherParameter;
  final String value;
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.weatherParameter,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 40,),
        const SizedBox(height: 3,),
        Text(weatherParameter, style: const TextStyle(fontSize: 17, color: Colors.white,),),
        const SizedBox(height: 3),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 15),),
      ],
    );
  }
}
