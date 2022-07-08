import 'dart:io';
import 'dart:convert';

void main() async {
  Directory current = Directory.current;
  String sep = Platform.pathSeparator;
  String currentPathStr = '${current.path}${sep}map_to_json_explore';
  String jsonTestFilePath = '$currentPathStr${Platform.pathSeparator}test.json';
  print(jsonTestFilePath);
  final File file = File(jsonTestFilePath); //load the json file
  List<Player> players = [];
  await readPlayerData(file, players); //read data from json file

  Player newPlayer = Player(
      //add a new item to data list
      'Samy Brook',
      '31',
      'cooking');


  players.add(newPlayer);

  print(players.length);

  players //convert list data  to json
      .map(
        (player) => player.toJson(),
      )
      .toList();

  String playersJsonStr = json.encode(players);

  file.writeAsStringSync(playersJsonStr); //write (the whole list) to json file
}

Future<void> readPlayerData(File file, List<Player> players) async {
  String playersJsonStr = await file.readAsString();
  List<dynamic> jsonResponse = jsonDecode(playersJsonStr);

  for (Map map in jsonResponse) {
    Player player = Player(map['name'], map['age'], map['hobby']);
    players.add(player);
  }
}

class Player {
  late String name;
  late String age;
  late String hobby;

  Player(
    this.name,
    this.age,
    this.hobby,
  );

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    hobby = json['hobby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['hobby'] = this.hobby;

    return data;
  }
}
