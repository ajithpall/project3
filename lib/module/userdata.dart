class UserData {
  String? username;
  String? password;
  String? confirmPassword;
  String? emailOrPhone;

  UserData({
    this.username,
    this.password,
    this.confirmPassword,
    this.emailOrPhone,
  });

  // Create UserData from a map
  factory UserData.fromMap(Map<String, String> map) {
    return UserData(
      username: map['username'],
      password: map['password'],
      confirmPassword: map['confirmpassword'],
      emailOrPhone: map['emailOrPhone'],
    );
  }

  // Convert UserData to a map
  Map<String, String> toMap() {
    return {
      'username': username ?? '',
      'password': password ?? '',
      'confirmpassword': confirmPassword ?? '',
      'emailOrPhone': emailOrPhone ?? '',
    };
  }
}
