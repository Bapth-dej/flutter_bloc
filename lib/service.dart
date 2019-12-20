import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> fetchUsernames(int number) async {
  String urlParams = "results=$number";

  String url = "https://randomuser.me/api?$urlParams";
  var res = await http.get(url);
  Map<String, dynamic> parsedRes = jsonDecode(res.body);

  List<String> listOfUserNames = [];
  for (var user in parsedRes["results"]) {
    listOfUserNames.add(user["name"]["first"]);
  }

  return listOfUserNames;
}
