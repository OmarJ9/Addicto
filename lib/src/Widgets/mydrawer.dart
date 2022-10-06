import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/assets_path.dart';
import 'package:addicto/src/Constants/colors.dart';
import 'package:addicto/src/Constants/strings.dart';
import 'package:addicto/src/Widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 10,
        bottom: SizeConfig.heightMultiplier * 10,
      ),
      child: Drawer(
        backgroundColor: MyColors.mycolors[5],
        width: SizeConfig.widthMultiplier * 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(MyAssets.drawerimage),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Addicto',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 3,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  MyDrawerItem(
                    icon: FontAwesomeIcons.clockRotateLeft,
                    title: 'Countdown Timer',
                    func: () {
                      Navigator.popAndPushNamed(context, homescreen);
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                  MyDrawerItem(
                    icon: FontAwesomeIcons.book,
                    title: 'Recommended Books',
                    func: () {
                      Navigator.popAndPushNamed(context, bookscreen);
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                  MyDrawerItem(
                    icon: FontAwesomeIcons.checkToSlot,
                    title: 'Addiction Test',
                    func: () {
                      Navigator.popAndPushNamed(context, testscreen);
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                  MyDrawerItem(
                    icon: FontAwesomeIcons.quoteLeft,
                    title: 'Motivational Quotes',
                    func: () {
                      Navigator.popAndPushNamed(context, quotescreen);
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
