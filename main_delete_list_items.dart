class Audio {
  String name;
  String path;

  Audio(this.name, this.path);
}

List<Audio> audioLst = [
  Audio('audio1', 'audio1.mp3'),
  Audio('audio2', 'audio2.mp3'),
  Audio('audio3', 'audio3.mp3'),
  Audio('audio4', 'audio4.mp3'),
  Audio('audio5', 'audio5.mp3'),
  Audio('audio6', 'audio6.mp3'),
  Audio('audio7', 'audio7.mp3'),
  Audio('audio8', 'audio8.mp3'),
  Audio('audio9', 'audio9.mp3'),
  Audio('audio10', 'audio10.mp3'),
];

void main(List<String> args) {
  print('audioLst.length: ${audioLst.length}');
  print('audioLst: $audioLst');

  for (Audio audio in audioLst) {
    audioLst.remove(audio);
  }

  print('audioLst.length: ${audioLst.length}');
  print('audioLst: $audioLst');
}
