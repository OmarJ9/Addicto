import 'package:flutter/material.dart';

class MyCircularButton extends StatelessWidget {
  final IconData icon;
  final void Function() func;
  final Color color;
  const MyCircularButton({
    Key? key,
    required this.icon,
    required this.func,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          elevation: 10,
          backgroundColor: color,
          fixedSize: const Size(50, 50)),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
