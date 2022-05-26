import 'event.dart';
import 'tranceiver.dart';

class Receiver extends Tranceiver {
    Receiver({required String name, required List<Event> eventLst})
      : super(name: name, eventLst: eventLst);
}