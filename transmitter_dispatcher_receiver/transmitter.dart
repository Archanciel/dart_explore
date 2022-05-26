import 'event.dart';
import 'tranceiver.dart';

class Transmitter extends Tranceiver {
  Transmitter({required String name, required List<Event> eventLst})
      : super(name: name, eventLst: eventLst);
}
