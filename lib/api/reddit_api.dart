import 'dart:convert';

import 'package:http/http.dart' as http;

Future getReddits() async {
  var endPointUrl = await http.get(
    Uri.parse(
        "https://www.reddit.com/r/flutterdev/top.json?count=20"),
  );
  var res = jsonDecode(endPointUrl.body)['data']['children'];
  print("Resr $res");
  return res;
}
