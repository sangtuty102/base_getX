class LoginModel {
  final String userName;
  final String password;
  LoginModel(
    this.userName,
    this.password,
  );

  Map<String, String> toJson() => {
        "email": userName,
        "password": password,
      };
}
