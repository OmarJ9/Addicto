import 'dart:convert';

import 'package:addicto/src/Constants/assets_path.dart';
import 'package:addicto/src/Models/book_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BooksProvider with ChangeNotifier {
  late List<BookModel> _ponitemslist;
  late List<BookModel> _drugitemslist;
  late List<BookModel> _alcoholitemslist;
  late List<BookModel> _internetitemslist;

  List<BookModel> get ponitemslist => _ponitemslist;
  List<BookModel> get drugitemslist => _drugitemslist;
  List<BookModel> get alcoholitemslist => _alcoholitemslist;
  List<BookModel> get internetitemslist => _internetitemslist;

  Future<void> init() async {
    _ponitemslist = await initbooks(MyAssets.ponbooks);
    _drugitemslist = await initbooks(MyAssets.drugbooks);
    _alcoholitemslist = await initbooks(MyAssets.alcoholbooks);
    _internetitemslist = await initbooks(MyAssets.internetbooks);
  }

  // This function is used to load local json assets (books info).
  Future<List<BookModel>> initbooks(String source) async {
    final response = await rootBundle.loadString(source);
    final data = jsonDecode(response) as List;
    return data.map((e) => BookModel.fromjson(e)).toList();
  }
}
