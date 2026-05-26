import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User entity - Domain layer
/// Represents a user in the business logic
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? phoneNumber,
    String? avatar,
    required UserRole role,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _User;

  const User._();

  /// Check if user is a vendor
  bool get isVendor => role == UserRole.vendor;

  /// Check if user is an admin
  bool get isAdmin => role == UserRole.admin;

  /// Check if user is a buyer
  bool get isBuyer => role == UserRole.buyer;

  /// Get user initials for avatar
  String get initials {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.substring(0, 1).toUpperCase();
  }
}

/// User role enum
enum UserRole {
  buyer,
  vendor,
  admin,
}
