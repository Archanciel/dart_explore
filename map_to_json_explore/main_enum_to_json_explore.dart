import 'dart:convert';
import 'dart:io';

enum Type { music, audio }

class Playlist {
  Type playlistType;

  Playlist({required this.playlistType});

  // Convert a Playlist object into a Map.
  Map<String, dynamic> toJson() => {
        'playlistType': playlistType.toString().split('.').last,
      };

  // Convert a Map into a Playlist object.
  factory Playlist.fromJson(Map<String, dynamic> json) {
    Type type = Type.values.firstWhere((e) => e.toString().split('.').last == json['playlistType']);
    return Playlist(playlistType: type);
  }

  @override
  String toString() {
    return 'Playlist{playlistType: $playlistType}';
  }
}

void main() async {
  // Create a new playlist and save it to a JSON file.
  Playlist playlist = Playlist(playlistType: Type.music);
  print(playlist);  // Should print: Playlist{playlistType: Type.music}

  String json = jsonEncode(playlist);
  File('playlist.json').writeAsStringSync(json);

  // Load a playlist from a JSON file.
  String loadedJson = File('playlist.json').readAsStringSync();
  Playlist loadedPlaylist = Playlist.fromJson(jsonDecode(loadedJson));
  print(loadedPlaylist);  // Should print: Playlist{playlistType: Type.music}

  print(loadedPlaylist.playlistType);  // Should print: Type.music
  File('playlist.json').deleteSync();
}
