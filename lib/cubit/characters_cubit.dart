import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/character_state.dart';
import 'package:http/http.dart' as http;

import '../models/character_model.dart';

class CharactersCubit extends Cubit<CharacterState> {
  CharactersCubit() : super(const CharacterState());

  Future<void> fetchCharacterLinks() async {
    final response =
        await http.get(Uri.parse("https://thronesapi.com/api/v2/characters"));

    emit(state.copyWith(status: Status.loading));

    if (response.statusCode == 200) {
      final characterList = (json.decode(response.body) as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
      emit(
        state.copyWith(
          status: Status.success,
          characterList: [...characterList],
        ),
      );
    } else {
      emit(
        state.copyWith(status: Status.fail),
      );
      throw Exception("Failed to Load Link");
    }
  }

  selectCharacter(CharacterModel selectedCharacter) {
    emit(
      state.copyWith(selectedCharacter: selectedCharacter),
    );
  }

  deselectCharacter() {
    emit(
      state.copyWith(selectedCharacter: null),
    );
  }
}
