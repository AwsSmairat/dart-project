abstract class User {
  String name;
  String password;

  User(this.name, this.password);
}

class Client extends User {
  int id;

  Client({required String name, required String password, required this.id})
    : super(name, password);
}

class Trainer extends User {
  int id;

  Trainer({required String name, required String password, required this.id})
    : super(name, password);
}

class Admin extends User {
  Admin() : super("aws", "aws123");
}
