class Event {
  String _name;
  double _price;

  Event({required String name, required double price})
      : _name = name,
        _price = price;

  String get name => _name;
  double get price => _price;
}
