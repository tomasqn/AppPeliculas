import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, required this.icon, required this.iconName,
  }) : super(key: key);

  final IconData icon;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30,),
        Text(iconName, style: const TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}