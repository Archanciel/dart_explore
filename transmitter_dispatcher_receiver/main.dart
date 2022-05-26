import 'dispatcher.dart';
import 'event.dart';
import 'transmitter.dart';

void main() {
  Dispatcher dispatcher = Dispatcher();
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
