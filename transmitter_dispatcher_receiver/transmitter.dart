import 'event.dart';
import 'tranceiver.dart';

class Transmitter extends Tranceiver {
  List<Event> _eventLst;

  Transmitter({required String name, required List<Event> eventLst})
      : _eventLst = eventLst,
        super(name: name);
}
