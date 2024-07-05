import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModels {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  // Default constructor
  CategoryModels({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  // Empty helper function
  static CategoryModels empty() =>
      CategoryModels(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  factory CategoryModels.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return CategoryModels(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModels.empty();
    }
  }


}