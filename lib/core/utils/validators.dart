import '../constants/app_constants.dart';
import '../constants/app_strings.dart';

/// Form validation utilities
class Validators {
  // Private constructor to prevent instantiation
  Validators._();

  /// Validate email format
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.validationRequired;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return AppStrings.validationEmailInvalid;
    }

    return null;
  }

  /// Validate password strength
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.validationRequired;
    }

    if (value.length < AppConstants.minPasswordLength) {
      return AppStrings.validationPasswordTooShort;
    }

    return null;
  }

  /// Validate password confirmation
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppStrings.validationRequired;
    }

    if (value != password) {
      return AppStrings.validationPasswordMismatch;
    }

    return null;
  }

  /// Validate phone number
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.validationRequired;
    }

    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');

    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s-]'), ''))) {
      return AppStrings.validationPhoneInvalid;
    }

    return null;
  }

  /// Validate required field
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return fieldName != null
          ? '$fieldName is required'
          : AppStrings.validationRequired;
    }
    return null;
  }

  /// Validate minimum length
  static String? minLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return AppStrings.validationRequired;
    }

    if (value.length < minLength) {
      return 'Must be at least $minLength characters';
    }

    return null;
  }

  /// Validate maximum length
  static String? maxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'Must be at most $maxLength characters';
    }

    return null;
  }
}
