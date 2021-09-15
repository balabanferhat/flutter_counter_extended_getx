class User {
  String name;
  String surname;
  int id;
  List<String>? favorites;

  User(
      {required this.name,
      required this.surname,
      required this.id,
      this.favorites});
}
