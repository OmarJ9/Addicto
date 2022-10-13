import 'package:addicto/src/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Config/size.dart';

class MyPopUpButton extends StatelessWidget {
  final HomeProvider provider;
  const MyPopUpButton({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        FontAwesomeIcons.squareCaretDown,
        size: SizeConfig.textMultiplier * 4,
        color: Colors.white,
      ),
      onSelected: (value) {
        provider.changechallengeday(value);
      },
      itemBuilder: (context) {
        return [
          _menuItem(2, '2 Days', FontAwesomeIcons.chevronRight, context),
          _menuItem(4, '4 Days', FontAwesomeIcons.chevronRight, context),
          _menuItem(7, '7 Days', FontAwesomeIcons.chevronRight, context),
          _menuItem(10, '10 Days', FontAwesomeIcons.chevronRight, context),
          _menuItem(20, '20 Days', FontAwesomeIcons.chevronRight, context),
          _menuItem(30, '30 Days', FontAwesomeIcons.chevronRight, context),
        ];
      },
    );
  }

  PopupMenuItem _menuItem(
      int value, String title, IconData icon, BuildContext context) {
    return PopupMenuItem(
        value: value,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
            ),
          ],
        ));
  }
}
