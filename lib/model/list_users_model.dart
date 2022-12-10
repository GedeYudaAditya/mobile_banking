class ListUsersModel {
  ListUsersModel({
    this.user_id,
    this.username,
    this.nama,
    // this.avatar = "https://reqres.in/img/faces/1-image.jpg",
    this.saldo,
  });

  int? user_id;
  String? username;
  String? nama;
  // String? avatar;
  double? saldo;

  factory ListUsersModel.fromJson(Map<String, dynamic> json) => ListUsersModel(
        user_id: int.parse(json["user_id"]),
        username: json["username"],
        nama: json["nama"],
        // avatar: json["avatar"],
        saldo: double.parse(json["saldo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": user_id,
        "username": username,
        "nama": nama,
        // "avatar": avatar,
        "saldo": saldo,
      };
}
