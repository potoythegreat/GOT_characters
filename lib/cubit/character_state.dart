import 'package:equatable/equatable.dart';
import '../models/character_model.dart';

enum Status { initial, loading, success, fail }

class CharacterState extends Equatable {
  const CharacterState({
    this.characterList = const [],
    this.selectedCharacter,
    this.status = Status.initial,
  });

  final CharacterModel? selectedCharacter;
  final List<CharacterModel> characterList;
  final Status status;

  @override
  List<Object?> get props => [selectedCharacter, characterList, status];

  CharacterState copyWith({
    CharacterModel? selectedCharacter,
    List<CharacterModel>? characterList,
    Status? status,
  }) {
    return CharacterState(
      //not required if not needed
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
      characterList: characterList ?? this.characterList,
      status: status ?? this.status,
    );
  }
}
