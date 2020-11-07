import 'dart:convert';

List<AuthorityModel> listAuthoritiesFromJson(String str) =>
    List<AuthorityModel>.from(json.decode(str).map((x) => x["authority"]));

AuthorityModel authorityModelFromJson(String str) =>
    AuthorityModel.fromJson(json.decode(str));

String authorityModelToJson(AuthorityModel data) => json.encode(data.toJson());

class AuthorityModel implements Comparable<AuthorityModel> {
  AuthorityModel({
    this.authority,
  });

  String authority;

  factory AuthorityModel.fromJson(Map<String, dynamic> json) => AuthorityModel(
    authority: json["authority"],
  );

  Map<String, dynamic> toJson() => {
    "authority": authority,
  };
  @override
  String toString() {
    return 'AuthorityModel{authority: $authority}';
  }

  @override
  int compareTo(AuthorityModel authorityModel) {
    return this.authority.compareTo(authorityModel.authority);
  }
}
