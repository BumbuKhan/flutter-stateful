class ValidationMixin {
  String validateEmail (value) {
      if (!value.contains('@')) {
        return 'Email is invalid';
      }

      return null;
  }

  String validatePassword (value) {
    if (value.length < 4) {
      return 'Incorrect password';
    }

    return null;
  }
}