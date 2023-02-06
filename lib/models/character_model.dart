import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  const CharacterModel(
      {required this.family,
      required this.title,
      required this.fullName,
      required this.imageUrl});

  final String fullName;
  final String title;
  final String family;
  final String imageUrl;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      fullName: json["fullName"],
      title: json["title"],
      family: json["family"],
      imageUrl: json["imageUrl"],
    );
  }

  @override
  List<Object?> get props => [family, title, fullName, imageUrl ];
}
