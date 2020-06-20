import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String name;
  String job;
  String id;
  String createdAt;

  /**
   * Created constructor User
   */
  User({this.name, this.job, this.id, this.createdAt});

  /**
   * Maping Object
   */

  factory User.userPostResult(Map<String, dynamic> object) {
    return User(
        name: object["name"],
        job: object["job"],
        id: object["id"],
        createdAt: object["createdAt"]);
  }

  /**
   * Create function post user
   */
  static Future<User> postUser(String name, String job) async {
    String url = 'https://reqres.in/api/users';

    var result = await http.post(url, body: {"name": name, "job": job});
    var jsonObj = json.decode(result.body);

    return User.userPostResult(jsonObj);
  }
}
