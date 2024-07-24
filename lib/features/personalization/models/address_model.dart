import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String ward;
  final String country;
  final String city;
  final DateTime? date;
  final String state;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.ward,
    required this.country,
    required this.city,
    required this.state,
    this.date,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => EFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      ward: '',
      country: '',
      state: '',
      city: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'Ward': ward,
      'Country': country,
      'City': city,
      'State': state,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      name: data['Name'] as String,
      phoneNumber: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      ward: data['Ward'] as String,
      country: data['Country'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      selectedAddress: data['SelectedAddress'] as bool,
      date: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  factory AddressModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
        id: snapshot.id,
        name: data['Name'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        street: data['Street'] ?? '',
        ward: data['Ward'] ?? '',
        country: data['Country'] ?? '',
        city: data['City'] ?? '',
        state: data['State'] ?? '',
        selectedAddress: data['SelectedAddress'] as bool,
        date: (data['DateTime'] as Timestamp).toDate());
  }

  @override
  String toString() {
    return 'AddressModel{street: $street, ward: $ward, country: $country, city: $city, state: $state}';
  }
}
