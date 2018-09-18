import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIController {
  static Future<bool> verifyUser(String username, String password) async {
    final String url = "192.168.0.4:5000/api/user/" + username;
    List data;

    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var resBody = json.decode(res.body);

    try {
      data.add(resBody["username"]);
      data.add(resBody["password"]);
    } catch (e) {
      print(e.toString());
    }

    print("####TEST DATA##### \n ################ \n data[0] + "
        " + data[1] \n #################");
    if (data[0] == username && data[1] == password) {
      return true;
    } else {
      return false;
    }
  }
}
