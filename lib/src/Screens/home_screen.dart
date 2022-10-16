import 'package:addicto/src/Provider/home_provider.dart';
import 'package:addicto/src/Utils/Services/hive_helper.dart';
import 'package:addicto/src/Widgets/challenge_item.dart';
import 'package:addicto/src/Widgets/mydrawer.dart';
import 'package:addicto/src/Widgets/myflat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../Config/size.dart';
import '../Utils/Services/awesome_notifications.dart';
import '../Widgets/mypopup_button.dart';
import '../Widgets/time_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (context.read<HomeProvider>().isrunning) {
      /*it will be called only once after Build widget done with rendering. Without it
      * you will get an error [setState() or markNeedsBuild() called during build.].
      * */
      context.read<HomeProvider>().startTimer(context);
      /*      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.read<HomeProvider>().startTimer(context);
      });*/
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: const MyDrawer(),
          drawerScrimColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Container(
                color: const Color.fromARGB(255, 13, 116, 50),
                height: SizeConfig.heightMultiplier * 45,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              FontAwesomeIcons.bars,
                              color: Colors.white,
                              size: SizeConfig.textMultiplier * 4,
                            ),
                          ),
                          (!provider.isrunning)
                              ? MyPopUpButton(
                                  provider: provider,
                                )
                              : const SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TimeCard(time: provider.days, title: "Days"),
                          TimeCard(time: provider.hours, title: "Hours"),
                          TimeCard(time: provider.minutes, title: "Minutes"),
                          TimeCard(time: provider.seconds, title: "Seconds"),
                        ],
                      ),
                      const Spacer(),
                      MyFlatButton(
                        title: provider.isrunning ? "Cancel" : "Start",
                        func: () {
                          if (provider.isrunning) {
                            provider.canceltimer();
                            NotificationsHandler()
                                .cancelScheduledNotifications();
                            HiveHelper().savePrimitives('isrunning', false);
                          } else {
                            provider.startTimer(context);
                            NotificationsHandler().createNotification(
                                provider.countdownduration.inSeconds);
                            HiveHelper().savePrimitives('isrunning', true);
                            DateTime dateTime = DateTime.now();
                            HiveHelper()
                                .savePrimitives('mydate', dateTime.toString());
                          }
                        },
                        color: provider.isrunning
                            ? Colors.red
                            : const Color.fromARGB(255, 77, 132, 202),
                        maxsize: SizeConfig.widthMultiplier * 50,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 13, 116, 50),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            SizeConfig.textMultiplier * 4,
                          ),
                          topRight: Radius.circular(
                            SizeConfig.textMultiplier * 4,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.textMultiplier * 3,
                          vertical: SizeConfig.textMultiplier * 3.5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Challenges That You Won :',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: SizeConfig.textMultiplier * 2.3,
                                  ),
                            ),
                            SizedBox(height: SizeConfig.heightMultiplier * 3),
                            Expanded(
                                child:provider.challenges.isEmpty
                                    ? Center(
                                  child: Lottie.asset(
                                    'assets/json/working-man.json',
                                    width:
                                    SizeConfig.widthMultiplier * 100,
                                    height:
                                    SizeConfig.widthMultiplier * 100,
                                    fit: BoxFit.contain,
                                  ),
                                )
                                    : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.challenges.length,
                              itemBuilder: (context, index) {
                                return ChallengeItem(
                                    index: index,
                                    challengedays: provider
                                        .challenges[index].challengedays,
                                    date: provider
                                        .challenges[index].finisheddate);
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Step 8
            ],
          ),
        ),
      ),
    );
  }
}
