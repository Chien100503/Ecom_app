import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  final String username;
  String phoneNumber;
  String profilePicture;
  String gender;
  String birthYear;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required this.gender,
      required this.birthYear});

  // Helper function to get the full name
  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => EFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '',
      gender: '',
      birthYear: 'yyyy/mm/dd');

  // Convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'phone': phoneNumber,
      'profilePicture': profilePicture,
      'gender': gender,
      'birthYear': birthYear,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
          id: document.id,
          firstName: data['firstName'] ?? '',
          lastName: data['lastName'] ?? '',
          email: data['email'] ?? '',
          username: data['username'] ?? '',
          phoneNumber: data['phone'] ?? '',
          profilePicture: data['profilePicture'] ?? '',
          gender: data['gender'] ?? '',
          birthYear: data['birthYear'] ?? 0,);
    } else {
      return UserModel.empty();
    }
  }
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? phoneNumber,
    String? profilePicture,
    String? gender,
    String? birthYear,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      gender: gender ?? this.gender,
      birthYear: birthYear ?? this.birthYear,
    );
  }
}
