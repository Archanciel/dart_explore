import 'event.dart';
import 'tranceiver.dart';

class Dispatcher {
  Map<Event, List<Tranceiver>> _eventListenerMap = {};

  void addListener(
      {required Tranceiver tranceiver, required List<Event> eventLst}) {
    for (Event event in eventLst) {
      if (_eventListenerMap[event] == null) {
        _eventListenerMap[event] = [];
      }

      _eventListenerMap[event]!.add(tranceiver);
    }
  }
}
