// https://pub.dev/packages/enough_serialization
import 'dart:io';
import 'package:enough_serialization/enough_serialization.dart';

enum ArticleArea { electronics, music }

class Article extends SerializableObject {
  Article() {
    // setting enum
    transformers['area'] = (value) =>
        value is ArticleArea ? value.index : ArticleArea.values[value];
  }

  // storing enum
  ArticleArea get area => attributes['area'];
  set area(ArticleArea value) => attributes['area'] = value;

  // storing String
  String get name => attributes['name'];
  set name(String value) => attributes['name'] = value;

  // storing int
  int get date => attributes['date'];
  set date(int value) => attributes['date'] = value;

  // storing double
  double get price => attributes['price'];
  set price(double value) => attributes['price'] = value;

  // storing bool
  bool get isDurable => attributes['durable'];
  set isDurable(bool value) => attributes['durable'] = value;
}

class ElectronicsArticle extends Article {
  ElectronicsArticle() {
    area = ArticleArea.electronics;
  }

  String get recommendation => attributes['recommendation'];
  set recommendation(String value) => attributes['recommendation'] = value;
}

class MusicArticle extends Article {
  MusicArticle() {
    area = ArticleArea.music;
    objectCreators['band'] = (map) => Band();
  }

  // storing class instance variable
  Band get band => attributes['band'];
  set band(Band value) => attributes['band'] = value;
}

class Band extends SerializableObject {
  String get name => attributes['name'];
  set name(String value) => attributes['name'] = value;

  int get year => attributes['year'];
  set year(int value) => attributes['year'] = value;

  Band({String? name, int? year}) {
    this.name = name ?? '';
    this.year = year ?? 0;
  }
}

/// Contains sub Article instances
class Order extends SerializableObject {
  /// Constructor returning a sub Article instance
  Order() {
    // setting list of Articles
    objectCreators['articles'] = (map) => <Article>[];

    // setting Article enum type
    objectCreators['articles.value'] = (map) {
      final int areaIndex = map!['area'];
      final area = ArticleArea.values[areaIndex];

      switch (area) {
        case ArticleArea.electronics:
          return ElectronicsArticle();
        case ArticleArea.music:
          return MusicArticle();
        default:
          return Article();
      }
    };
  }

  List<Article> get articles => attributes['articles'];
  set articles(List<Article> value) => attributes['articles'] = value;

  Future<Order> loadOrderFromFile({required String filePathName}) async {
    final Serializer serializer = Serializer();
    final String inputJsonStr = await File(filePathName).readAsString();
    final Order deserializedOrder = this;
    serializer.deserialize(inputJsonStr, deserializedOrder);

    return deserializedOrder;
  }

  void saveOrderToFile({required String filePathName}) {
    final Serializer serializer = Serializer();
    final String orderJsonStr = serializer.serialize(this);

    print(
        'order json string before writing it to $filePathName:\n$orderJsonStr\n\n');

    File(filePathName).writeAsStringSync(orderJsonStr);
  }
}

Future<void> main() async {
  final Order order = Order()
    ..articles = [
      ElectronicsArticle()
        ..name = 'CD Player'
        ..date = 2021
        ..price = 99.95
        ..recommendation = 'Consider our streaming option, too!'
        ..isDurable = false,
      ElectronicsArticle()
        ..name = 'MC Tape Deck'
        ..date = 2022
        ..price = 75
        ..recommendation = 'Old school, like it!'
        ..isDurable = false,
      MusicArticle()
        ..name = 'The white album'
        ..date = 1962
        ..price = 19.95
        ..band = Band(name: 'Beatles', year: 1962)
        ..isDurable = true
    ];

  // saving to local file
  String jsonFilePathName = 'order.json';

  order.saveOrderToFile(filePathName: jsonFilePathName);

  final Order orderFromFile = Order();

  await orderFromFile.loadOrderFromFile(filePathName: jsonFilePathName);

  for (int i = 0; i < orderFromFile.articles.length; i++) {
    final Article article = orderFromFile.articles[i];
    print('article_$i.area: ${article.area}');
    print('article_$i.name: ${article.name}');
    print('article_$i.date: ${article.date}');
    print('article_$i.price: ${article.price}');
    print('article_$i.durable: ${article.isDurable}');

    if (article is ElectronicsArticle) {
      print('electronicsArticle_$i.recommendation: ${article.recommendation}');
    } else if (article is MusicArticle) {
      print('musicArticle_$i.band-name: ${article.band.name}');
      print('musicArticle_$i.band-year: ${article.band.year}');
    }
  }
}
