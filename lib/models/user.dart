class User {
  String name;
  int age;
  double height;

  User(this.name, this.age, this.height);

  User.empty() {
    this.name = "";
    this.age = 0;
    this.height = 0;
  }
}
