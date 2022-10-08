import 'package:addicto/src/Config/size.dart';
import 'package:addicto/src/Constants/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookItem extends StatelessWidget {
  final String img, author, title, description, date, link;
  final double rating;
  const BookItem(
      {super.key,
      required this.img,
      required this.author,
      required this.title,
      required this.description,
      required this.date,
      required this.link,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 10,
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 1,
        horizontal: SizeConfig.widthMultiplier * 3,
      ),
      child: SizedBox(
        height: SizeConfig.heightMultiplier * 20,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: img,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: SizeConfig.widthMultiplier * 27,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )),
                );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(child: Text('Loading...')),
              errorWidget: (context, url, error) {
                return const SizedBox(
                    width: 100,
                    height: double.infinity,
                    child: Icon(FontAwesomeIcons.circleExclamation));
              },
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 4,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 17, 10, 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: SizeConfig.textMultiplier * 1.7,
                          ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    Row(
                      children: [
                        Text(
                          author,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.3,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 2,
                        ),
                        Text(
                          date,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.3,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: SizeConfig.textMultiplier * 1.3,
                          ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                              rating.toInt() + 1,
                              (index) => Icon(
                                    index == rating.toInt()
                                        ? Icons.star_half
                                        : Icons.star,
                                    color: Colors.amber,
                                    size: SizeConfig.textMultiplier * 2.4,
                                  )),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, webpagescreen,
                                arguments: link);
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Visit Amazon',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: SizeConfig.textMultiplier * 1,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
