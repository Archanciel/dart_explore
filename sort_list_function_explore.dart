class Audio {
  String title;
  DateTime downloadTime;

  Audio({required this.title, required this.downloadTime});
}

List<Audio> sortListAudio({
  required List<Audio> lstToSort,
  required String sortOnNameStr,
  bool isSortAscending = true,
}) {
  lstToSort.sort((a, b) {
    dynamic aValue;
    dynamic bValue;

    switch (sortOnNameStr) {
      case 'title':
        aValue = a.title;
        bValue = b.title;
        break;
      case 'downloadTime':
        aValue = a.downloadTime;
        bValue = b.downloadTime;
        break;
      default:
        throw ArgumentError(
            'Invalid sortOnAudioInstanceVariable: $sortOnNameStr');
    }

    int compareResult = aValue.compareTo(bValue);

    return isSortAscending ? compareResult : -compareResult;
  });

  return lstToSort;
}

void main() {
  List<Audio> audioLst = [
    Audio(title: 'B', downloadTime: DateTime(2023, 1, 3)),
    Audio(title: 'A', downloadTime: DateTime(2023, 1, 1)),
    Audio(title: 'C', downloadTime: DateTime(2023, 1, 2)),
  ];

  List<Audio> sortedList = sortListAudio(
    lstToSort: audioLst,
    sortOnNameStr: 'downloadTime',
  );
  printAudioList(sortedList);

  sortedList = sortListAudio(
    lstToSort: audioLst,
    sortOnNameStr: 'downloadTime',
    isSortAscending: false,
  );
  printAudioList(sortedList);

  sortedList = sortListAudio(
    lstToSort: audioLst,
    sortOnNameStr: 'title',
  );
  printAudioList(sortedList);

  sortedList = sortListAudio(
    lstToSort: audioLst,
    sortOnNameStr: 'title',
    isSortAscending: false,
  );
  printAudioList(sortedList);
}

void printAudioList(List<Audio> sortedList) {
  print('');

  for (Audio audio in sortedList) {
    print('${audio.title} - ${audio.downloadTime}');
  }
}
