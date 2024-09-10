class Password {
  final String value;

  Password(this.value) {
    if (value.isEmpty || value.length < 6) {
      throw ArgumentError("Password must be at least 6 characters long.");
    }
  }
}