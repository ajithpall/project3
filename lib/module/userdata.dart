class UserData {
  static String username = '';
  static String password = '';
  static String confirmPassword = '';
  static String emailOrPhone = '';

  // Method to populate fields from a Map
  static void fromMap(Map<String, String> data) {
    username = data['username'] ?? '';
    password = data['password'] ?? '';
    confirmPassword = data['confirmpassword'] ?? '';
    emailOrPhone = data['emailOrPhone'] ?? '';
  }
}
