import 'event.dart';

class Tranceiver {
  String _name;
  List<Event> _eventLst;

  Tranceiver({required String name, required List<Event> eventLst})
      : _name = name,
        _eventLst = eventLst;

  String get name => _name;
  List<Event> get eventLst => _eventLst;
}
