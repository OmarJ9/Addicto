import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/consts_variables.dart';
import 'package:addicto/src/Models/book_model.dart';
import 'package:addicto/src/Provider/books_provider.dart';
import 'package:addicto/src/Widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BooksProvider provider = Provider.of<BooksProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 15,
            bottom: 20,
            right: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  Text(
                    'Recommended Books',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2.3,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              TabBar(
                  controller: _controller,
                  isScrollable: false,
                  physics: const BouncingScrollPhysics(),
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: SizeConfig.heightMultiplier * 1),
                  labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: SizeConfig.heightMultiplier * 1.4,
                      color: MyColors.green),
                  unselectedLabelColor:
                      const Color.fromARGB(255, 131, 125, 125),
                  padding: EdgeInsets.zero,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.amber,
                  tabs: mytabs),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    _buildlistview(provider.ponitemslist),
                    _buildlistview(provider.drugitemslist),
                    _buildlistview(provider.alcoholitemslist),
                    _buildlistview(provider.internetitemslist),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlistview(List<BookModel> list) {
    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return BookItem(
            img: list[index].img,
            author: list[index].author,
            title: list[index].name,
            description: list[index].description,
            date: list[index].date,
            link: list[index].link,
            rating: list[index].rate);
      },
    );
  }
}
