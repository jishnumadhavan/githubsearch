class User {

  User(
  {
    this.name, this.id, this.avatar, required this.noofrepo, this.email, this.location
}
      );

  String? name;
  String? avatar;
  String? id;
  String? location;
  int noofrepo;
  String? email;

}