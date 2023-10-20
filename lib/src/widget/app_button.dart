import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String data;
  final GestureTapCallback onPressed;
  const AppButton({Key? key, required this.data, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(data));
  }
}
