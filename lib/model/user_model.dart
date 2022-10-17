

class UserModel{
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar
});



  factory UserModel.fromJson (Map<String,dynamic> json){
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'] ?? " First Name",
      lastName: json['last_name'] ?? "Last Name",
      avatar: json['avatar'] ??
          'https://icon-library.com/icon/avatar-icon-images-4.html',
    );
  }
}



