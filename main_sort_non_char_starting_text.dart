class Playlist {
  String playlistName;
  List<Audio> audioList;

  Playlist.fullConstructor({
    required this.playlistName,
    required this.audioList,
  });
}

class Audio {
  Playlist? enclosingPlaylist;
  String originalVideoTitle;
  String compactVideoDescription;
  String validVideoTitle;
  String videoUrl;
  DateTime audioDownloadDateTime;
  Duration audioDownloadDuration;
  int audioDownloadSpeed;
  DateTime videoUploadDate;
  Duration audioDuration;
  bool isMusicQuality;
  String audioFileName;
  int audioFileSize;

  Audio.fullConstructor({
    required this.enclosingPlaylist,
    required this.originalVideoTitle,
    required this.compactVideoDescription,
    required this.validVideoTitle,
    required this.videoUrl,
    required this.audioDownloadDateTime,
    required this.audioDownloadDuration,
    required this.audioDownloadSpeed,
    required this.videoUploadDate,
    required this.audioDuration,
    required this.isMusicQuality,
    required this.audioFileName,
    required this.audioFileSize,
  });

  @override
  String toString() {
    return '$validVideoTitle\n';
  }
}

void main() {
  List<String> videoTitleLst = [
    "'title",
    "%avec percent title",
    "%percent title",
    "power title",
    "#'amen title",
    "%95 title",
    "93 title",
    "#94 title",
    "évident title",
    "à lire title",
    "9 title",
    "8 title",
    "%éventuel title",
  ];

  Audio? title;
  Audio? avec_percent_title;
  Audio? percent_title;
  Audio? power_title;
  Audio? amen_title;
  Audio? ninety_five_title;
  Audio? ninety_three_title;
  Audio? ninety_four_title;
  Audio? evident_title;
  Audio? a_lire_title;
  Audio? nine_title;
  Audio? eight_title;
  Audio? eventuel_title;

  List<Audio?> audioLst = [
    title,
    avec_percent_title,
    percent_title,
    power_title,
    amen_title,
    ninety_five_title,
    ninety_three_title,
    ninety_four_title,
    evident_title,
    a_lire_title,
    nine_title,
    eight_title,
    eventuel_title,
  ];

  int i = 0;
  for (String videoTitle in videoTitleLst) {
    audioLst[i] = Audio.fullConstructor(
      enclosingPlaylist: null,
      originalVideoTitle: videoTitle,
      compactVideoDescription: 'compactVideoDescription',
      validVideoTitle: videoTitle,
      videoUrl: 'videoUrl',
      audioDownloadDateTime: DateTime.now(),
      audioDownloadDuration: Duration(seconds: 1),
      audioDownloadSpeed: 1,
      videoUploadDate: DateTime.now(),
      audioDuration: Duration(seconds: 1),
      isMusicQuality: true,
      audioFileName: 'audioFileName',
      audioFileSize: 1,
    );
    i++;
  }

  print('');

  List<String> sortedLst = oldSort(List<String>.from(videoTitleLst));
  print(sortedLst);

  print('');

  List<Audio> sortedAudioLst = correctSort(List<Audio>.from(audioLst));
  print(sortedAudioLst);
}

List<String> oldSort(
  List<String> videoTitleLst,
) {
  videoTitleLst.sort((a, b) {
    return a.toLowerCase().compareTo(b.toLowerCase());
  });

  return videoTitleLst; // videoTitleLst is now sorted
}

List<Audio> correctSort(List<Audio> audioLst) {
  audioLst.sort((a, b) {
    String cleanA =
        a.validVideoTitle.replaceAll(RegExp(r'[^A-Za-z0-9éèêëîïôœùûüÿç]'), '');
    String cleanB =
        b.validVideoTitle.replaceAll(RegExp(r'[^A-Za-z0-9éèêëîïôœùûüÿç]'), '');
    return cleanA.compareTo(cleanB);
  });

  return audioLst; // audioLst is now sorted
}
