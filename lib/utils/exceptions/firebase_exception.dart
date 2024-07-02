class EFirebaseException implements Exception {
  final String code;

  EFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'User not found.';
      case 'wrong-password':
        return 'The password is invalid.';
      default:
        return 'An error occurred: $code';
    }
  }
}
