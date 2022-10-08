class BookModel {
  final String name;
  final String author;
  final String date;
  final double rate;
  final String description;
  final String img;
  final String link;
  BookModel({
    required this.name,
    required this.author,
    required this.date,
    required this.rate,
    required this.description,
    required this.img,
    required this.link,
  });

  factory BookModel.fromjson(Map<String, dynamic> json) {
    return BookModel(
      name: json['name'],
      author: json['author'],
      date: json['date'],
      rate: json['rate'],
      description: json['description'],
      img: json['img'],
      link: json['amazon'],
    );
  }
  @override
  String toString() {
    return '\ntitle = $name \ndescription = $description \nauthor = $author \ndate = $date \nrate = $rate\n ========================================================================';
  }
}
