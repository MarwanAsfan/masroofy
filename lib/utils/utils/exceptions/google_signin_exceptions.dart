/// Custom exception class to handle various Google Sign-In related errors.
class AGoogleSignInException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  AGoogleSignInException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
    // --- Common User Interactions ---
      case 'sign_in_canceled':
      case 'canceled':
        return 'The sign-in process was canceled by the user.';

    // --- Network & Server Issues ---
      case 'network_error':
        return 'A network error occurred. Please check your internet connection and try again.';
      case 'server_error':
        return 'A server error occurred while trying to sign in. Please try again later.';

    // --- Failure States ---
      case 'sign_in_failed':
        return 'Sign-in failed. If you are the developer, check your SHA-1 fingerprint in the Firebase console.';
      case 'sign_in_required':
        return 'Sign-in is required to access this content.';

    // --- Account/Scopes Issues ---
      case 'invalid_scope':
        return 'The requested access scope is invalid.';
      case 'id_token_error':
        return 'Failed to retrieve the Google ID Token.';
      case 'user_recoverable_auth':
        return 'The user needs to grant permission manually. Please try again.';

    // --- Internal/Platform Specific ---
      case 'api_not_connected':
        return 'Google Play Services is not available or not connected.';
      case 'missing_dependencies':
        return 'Google Sign-In dependencies are missing on the device.';

      default:
        return 'An unexpected Google Sign-In error occurred. Code: $code';
    }
  }
}