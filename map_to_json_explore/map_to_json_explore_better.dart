// https://pub.dev/packages/enough_serialization
import 'dart:io';
import 'package:enough_serialization/enough_serialization.dart';

enum ArticleArea { electronics, music }

class Article extends SerializableObject {
  Article() {
    transformers['area'] = (value) =>
        value is ArticleArea ? value.index : ArticleArea.values[value];
  }

  ArticleArea get area => attributes['area'];
  set area(ArticleArea value) => attributes['area'] = value;

  String get name => attributes['name'];
  set name(String value) => attributes['name'] = value;

  int get price => attributes['price'];
  set price(int value) => attributes['price'] = value;
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

class Order extends SerializableObject {
  Order() {
    objectCreators['articles'] = (map) => <Article>[];
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
}

Future<Order> loadOrderFromFile({required String filePathName}) async {
  final Serializer serializer = Serializer();
  final String inputJsonStr = await File(filePathName).readAsString();
  final Order deserializedOrder = Order();
  serializer.deserialize(inputJsonStr, deserializedOrder);

  return deserializedOrder;
}

void saveOrderToFile({required String filePathName, required Order order}) {
  final Serializer serializer = Serializer();
  final String orderJsonStr = serializer.serialize(order);

  print(
      'order json string before writing it to $filePathName:\n$orderJsonStr\n\n');

  File(filePathName).writeAsStringSync(orderJsonStr);
}

Future<void> main() async {
  final Order order = Order()
    ..articles = [
      ElectronicsArticle()
        ..name = 'CD Player'
        ..price = 3799
        ..recommendation = 'Consider our streaming option, too!',
      ElectronicsArticle()
        ..name = 'MC Tape Deck'
        ..price = 12399
        ..recommendation = 'Old school, like it!',
      MusicArticle()
        ..name = 'The white album'
        ..price = 1899
        ..band = Band(name: 'Beatles', year: 1962)
    ];

  // saving to local file
  String jsonFilePathName = 'order.json';

  saveOrderToFile(filePathName: jsonFilePathName, order: order);

  final Order orderFromFile = await loadOrderFromFile(filePathName: jsonFilePathName);

  for (int i = 0; i < orderFromFile.articles.length; i++) {
    final Article article = orderFromFile.articles[i];
    print('article_$i.area: ${article.area}');
    print('article_$i.name: ${article.name}');
    print('article_$i.price: ${article.price}');

    if (article is ElectronicsArticle) {
      print('electronicsArticle_$i.recommendation: ${article.recommendation}');
    } else if (article is MusicArticle) {
      print('musicArticle_$i.band-name: ${article.band.name}');
      print('musicArticle_$i.band-year: ${article.band.year}');
    }
  }
}
