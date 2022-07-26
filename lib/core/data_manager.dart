import 'dart:collection';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';

import 'package:m_two/core/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<io.File?> get _localFile async {
  final path = await _localPath;
  File('$path/Users.json').create(recursive: true);
  io.File UserData = io.File('$path/Users.json');
  return UserData;
}

Future addUser(UserModel UserModel) async => readUsers().then((currentContent) async {
      final file = await _localFile;
      currentContent.addAll({UserModel.username: UserModel.toJson()});
      file!.writeAsString(json.encode(currentContent));
      return;
    });

Future removeUser(UserModel UserModel) async => readUsers().then((currentContent) async {
      final file = await _localFile;
      currentContent.removeWhere((key, value) => key == UserModel.username);
      file!.writeAsString(json.encode(currentContent));
      return;
    });

Future sortUsersByName() async => readUsers().then((currentContent) async {
      final file = await _localFile;
      List<String> sortedList = currentContent.keys.toList()..sort();
      Map<String, dynamic> sortedMap = {};
      for (int i = 0; i < sortedList.length; i++) {
        sortedMap.addEntries([MapEntry(sortedList[i], currentContent[sortedList[i]])]);
      }
      file!.writeAsString(json.encode(sortedMap));
      return;
    });

Future sortUsersByDate() async => readUsers().then((currentContent) async {
      final file = await _localFile;
      List<String> sortedList = currentContent.values.map((e) => e["last_modified_date_time"].toString()).toList()..sort();
      Map<String, dynamic> sortedMap = {};
      for (int i = 0; i < sortedList.length; i++) {
        String key = currentContent.values.singleWhere((element) => element["last_modified_date_time"] == sortedList[i])["title"];
        sortedMap.addEntries([MapEntry(key, currentContent[key])]);
      }
      file!.writeAsString(json.encode(sortedMap));
      return;
    });

Map<String, UserModel> extractUsers(Map<String, dynamic> data) {
  return data.map(
    (title, content) => MapEntry(
      title,
      UserModel.fromJson(content, title),
    ),
  );
}

Future<Map<String, dynamic>> readUsers() async {
  try {
    final file = await _localFile;
    var contents;
    if (file != null) {
      contents = await file.readAsString();
    }
    return contents != null ? jsonDecode(contents) : {};
  } catch (e) {
    print(e);
    return {};
  }
}
