import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final String title;
  final double maxsize;
  final void Function() func;
  final Color color;
  const MyFlatButton(
      {Key? key,
      required this.title,
      required this.func,
      required this.color,
      required this.maxsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          backgroundColor: color,
          maximumSize: Size(maxsize, 45),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
