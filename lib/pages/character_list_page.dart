import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/character_state.dart';
import 'package:pokedex/cubit/characters_cubit.dart';
import 'package:pokedex/widgets/list_item.dart';
import '../models/character_model.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key, required this.characterList});
  final List<CharacterModel> characterList;

  static Page page(List<CharacterModel> characterlist) {
    return MaterialPage(
      child: CharacterListPage(
        characterList: characterlist,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharacterState>(
      builder: (context, state) {
        return state.status == Status.loading || state.status == Status.initial
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text("GOT CHARACTERS"),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ListView.builder(
                    itemCount: characterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(character: characterList[index]);
                    },
                  ),
                ),
              );
      },
    );
  }
}
