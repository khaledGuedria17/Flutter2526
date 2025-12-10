import 'dart:convert';

class User {
  //att
  late String id, name, email, password, role, tier, token;

  User(this.email, this.name, this.password, this.role, this.tier);

  String toJson() {
    Map<String, dynamic> object = {
      "accessToken": token,
      "user": {
        "name": name,
        "provider": "local",
        "subjects": [],
        "joinedCourseIds": [],
        "id": id,
        "email": email,
        "role": role,
        "tier": tier,
      },
    };
    return json.encode(object);
  }

  static User toUser(String jsonObject) {
    Map<String, dynamic> objectJson = json.decode(jsonObject);
    Map<String, dynamic> userJson = objectJson["user"];
    var currentUser = User(
      userJson["email"],
      userJson["name"],
      "password",
      userJson["role"],
      userJson["tier"],
    );
    currentUser.id = userJson["id"];
    currentUser.token = objectJson["accessToken"];
    return currentUser;
  }
}
