import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/character_model.dart';
import 'package:transparent_image/transparent_image.dart';
import '../cubit/characters_cubit.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key, required this.character});
  final CharacterModel character;

  static Page page({required CharacterModel character}) {
    return MaterialPage(child: CharacterPage(character: character));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CharactersCubit>().deselectCharacter();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                character.fullName,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(children: [
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: character.imageUrl,
                    ),
                  ),
                ]),
              ),
              Column(
                children: [
                  Text(
                    "Title: ${character.title}",
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Family: ${character.family}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
