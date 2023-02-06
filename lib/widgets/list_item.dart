import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/characters_cubit.dart';
import '../models/character_model.dart';

class ListItem extends StatelessWidget {
  final CharacterModel character;
  const ListItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: UnconstrainedBox(
        child: SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
              ),
              child: Text(
                character.fullName,
                style: const TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  context.read<CharactersCubit>().selectCharacter(character)),
        ),
      ),
    );
  }
}
