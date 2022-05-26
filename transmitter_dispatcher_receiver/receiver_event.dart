import 'event.dart';

class ReceiverEvent extends Event {
  ReceiverEvent({required String name, required double price})
      : super(name: name, price: price);

  Future<String> execute(Duration duration) async =>
    await Future.delayed(duration, () => '$name at $price \$');
  }
