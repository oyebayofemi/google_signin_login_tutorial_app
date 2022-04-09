class Userdetails {
  String? email;
  String? photourl;
  String? displayName;

  Userdetails(
      {required this.displayName, required this.email, required this.photourl});

  Map<String, dynamic> toMap() {
    return {
      'displayName': this.displayName,
      'email': this.email,
      'photourl': this.photourl
    };
  }
}
