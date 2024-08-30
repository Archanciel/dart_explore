import 'dart:core';

void main() {
  List<String> chapters = [
    'mon livre chapitre 1 - 1',
    'mon livre chapitre 1 - 2',
    'mon livre chapitre 1 - 3',
    'mon livre chapitre 10 - 1',
    'mon livre chapitre 10 - 2',
    'mon livre chapitre 11',
    'mon livre chapitre 12',
    'mon livre chapitre 2 - 1',
    'mon livre chapitre 2 - 2',
    'mon livre chapitre 2 - 3',
    'mon livre chapitre 2 - 4',
    'mon livre chapitre 3',
    'mon livre chapitre 4 - 1',
    'mon livre chapitre 4 - 2',
    'mon livre chapitre 5',
    'mon livre chapitre 6',
    'mon livre chapitre 7',
    'mon livre chapitre 8',
    'mon livre chapitre 9',
  ];

  chapters.sort((a, b) => compareChapters(a, b));

  for (var chapter in chapters) {
    print(chapter);
  }
}

int compareChapters(String a, String b) {
  final chapterRegex = RegExp(r'chapitre (\d+)(?:\s*-\s*(\d+))?');

  var matchA = chapterRegex.firstMatch(a);
  var matchB = chapterRegex.firstMatch(b);

  if (matchA != null && matchB != null) {
    var chapterA = int.parse(matchA.group(1)!);
    var chapterB = int.parse(matchB.group(1)!);

    if (chapterA != chapterB) {
      return chapterA.compareTo(chapterB);
    }

    // Handle sub-chapters
    var subChapterA = matchA.group(2) != null ? int.parse(matchA.group(2)!) : 0;
    var subChapterB = matchB.group(2) != null ? int.parse(matchB.group(2)!) : 0;

    return subChapterA.compareTo(subChapterB);
  }

  return a.compareTo(b);
}
