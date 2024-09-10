class Email {
  final String value;

  Email(this.value) {
    if (!_validateEmail(value)) {
      throw ArgumentError("Invalid email format.");
    }
  }

  bool _validateEmail(String email) {
    // Basic email validation (you can improve this regex)
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }
}