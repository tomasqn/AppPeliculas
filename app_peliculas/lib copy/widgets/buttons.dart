import 'package:diseno_1/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomButton(icon: Icons.phone, iconName: 'Call',),
          Expanded(child: Container()),
          const CustomButton(icon: Icons.attach_email, iconName: 'Route',),
          Expanded(child: Container()),
          const CustomButton(icon: Icons.share, iconName: 'Share',),
        ]
      ),
    );
  }
}