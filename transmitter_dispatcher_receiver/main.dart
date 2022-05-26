import 'dispatcher.dart';
import 'event.dart';
import 'receiver.dart';
import 'receiver_event.dart';
import 'transmitter.dart';

void main() {
  Dispatcher dispatcher = Dispatcher();

  Consumer jp = Consumer(revenue: 2300, name: 'Jean-Pierre', eventLst: [
    Food(calories: 2500, price: 10, name: 'Lidl'),
    SmartPhone(phoneNumber: 0768224987, brand: 'Galaxy', price: 650),
  ]);

  dispatcher.addListener(transmitter: jp);

  Consumer joe = Consumer(revenue: 8000, name: 'Joe', eventLst: [
    Food(calories: 3500, price: 20, name: 'Coop'),
    SmartPhone(phoneNumber: 0793219024, brand: 'Apple', price: 900),
  ]);

  dispatcher.addListener(transmitter: joe);

  Farmer jm = Farmer(employeeNumber: 5, name: 'Jean-Michel', eventLst: [
    Food(calories: 2700, price: 15, name: 'Coop'),
    Tractor(power: 60, brand: 'John Deer', price: 60000),
    SmartPhone(phoneNumber: 0782170062, brand: 'Galaxy', price: 650),
  ]);

  dispatcher.addListener(transmitter: jm);

  Receiver lidl = Receiver(name: 'Lidl', eventLst: [
    SellFood(price: 30),
  ]);

  dispatcher.addReceiver(receiver: lidl);

  Receiver microspot = Receiver(name: 'Microspot', eventLst: [
    SendArticle(price: 700),
  ]);

  dispatcher.addReceiver(receiver: microspot);

  Receiver tractorRepair = Receiver(name: 'TractorRepair', eventLst: [
    RepairTractor(price: 8000),
  ]);

  dispatcher.addReceiver(receiver: tractorRepair);
}

class Consumer extends Transmitter {
  double _revenue;

  Consumer(
      {required double revenue,
      required String name,
      required List<Event> eventLst})
      : _revenue = revenue,
        super(eventLst: eventLst, name: name);
}

class Farmer extends Transmitter {
  int _employeeNumber;

  Farmer(
      {required int employeeNumber,
      required String name,
      required List<Event> eventLst})
      : _employeeNumber = employeeNumber,
        super(eventLst: eventLst, name: name);
}

class Food extends Event {
  int _calories;

  Food({required int calories, required double price, required String name})
      : _calories = calories,
        super(name: name, price: price);
}

class SmartPhone extends Event {
  int _phoneNumber;

  SmartPhone(
      {required int phoneNumber, required String brand, required double price})
      : _phoneNumber = phoneNumber,
        super(name: brand, price: price);
}

class Tractor extends Event {
  double _power;

  Tractor({required double power, required String brand, required double price})
      : _power = power,
        super(name: brand, price: price);
}

class SellFood extends ReceiverEvent {
  SellFood({required double price}) : super(name: 'sell food', price: price);

  Future<String> executeAsync() async {
    String str = await super.execute(Duration(seconds: 2));

    return str;
  }
}

class SendArticle extends ReceiverEvent {
  SendArticle({required double price})
      : super(name: 'send article', price: price);

  Future<String> executeAsync() async {
    String str = await super.execute(Duration(seconds: 10));

    return str;
  }
}

class RepairTractor extends ReceiverEvent {
  RepairTractor({required double price})
      : super(name: 'repair tractor', price: price);

  Future<String> executeAsync() async {
    String str = await super.execute(Duration(seconds: 15));

    return str;
  }
}
