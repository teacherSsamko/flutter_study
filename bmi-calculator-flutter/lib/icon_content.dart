import 'package:flutter/material.dart';

const textLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: textLabelStyle,
        ),
      ],
    );
  }
}
