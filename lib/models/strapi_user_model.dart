import 'dart:convert';

class StrapiUserModel {
  StrapiUserModel({
    required this.jwt,
    required this.user,
  });

  final String jwt;
  final User user;

  factory StrapiUserModel.fromJson(String str) =>
      StrapiUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StrapiUserModel.fromMap(Map<String, dynamic> json) => StrapiUserModel(
        jwt: json["jwt"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "jwt": jwt,
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String username;
  final String email;
  final String provider;
  final bool confirmed;
  final bool blocked;
  final String createdAt;
  final String updatedAt;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class StrapiLoginError {
  StrapiLoginError({
    required this.error,
  });

  final Error error;

  factory StrapiLoginError.fromJson(String str) =>
      StrapiLoginError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StrapiLoginError.fromMap(Map<String, dynamic> json) =>
      StrapiLoginError(
        error: Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error.toMap(),
      };
}

class Error {
  Error({
    required this.status,
    required this.name,
    required this.message,
    required this.details,
  });

  final int status;
  final String name;
  final String message;
  final Details details;

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error(
        status: json["status"],
        name: json["name"],
        message: json["message"],
        details: Details.fromMap(json["details"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "name": name,
        "message": message,
        "details": details.toMap(),
      };
}

class Details {
  Details();

  factory Details.fromJson(String str) => Details.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Details.fromMap(Map<String, dynamic> json) => Details();

  Map<String, dynamic> toMap() => {};
}
