import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percet) {
  if (percet >= 0.50) {
    return Theme.of(context).primaryColor;
  } else if (percet >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
