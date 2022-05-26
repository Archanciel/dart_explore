import 'event.dart';
import 'receiver.dart';
import 'transmitter.dart';

class Dispatcher {
  Map<String, List<Transmitter>> _eventListenerMap = {};
  Map<String, List<Receiver>> _eventReceiverMap = {};

  void addListener(
      {required Transmitter transmitter}) {
    List<Event> eventLst = transmitter.eventLst;

    for (Event event in eventLst) {
      if (_eventListenerMap[event.name] == null) {
        _eventListenerMap[event.name] = [];
      }

      _eventListenerMap[event.name]!.add(transmitter);
    }
  }

  void addReceiver({required Receiver receiver}) {
   List<Event> eventLst = receiver.eventLst;

    for (Event event in eventLst) {
      if (_eventReceiverMap[event.name] == null) {
        _eventReceiverMap[event.name] = [];
      }

      _eventReceiverMap[event.name]!.add(receiver);
    }
  }
}
