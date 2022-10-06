import 'package:addicto/src/Config/size.dart';
import 'package:flutter/material.dart';

class MyDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() func;
  const MyDrawerItem(
      {super.key, required this.icon, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 4,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: SizeConfig.textMultiplier * 1.7, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
