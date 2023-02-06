import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/character_state.dart';
import 'cubit/characters_cubit.dart';
import 'pages/character_list_page.dart';
import 'pages/character_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Page> onGeneratePages(CharacterState state, List<Page> page) {
    final selectedCharacter = state.selectedCharacter;
    return [
      CharacterListPage.page(state.characterList),
      if (selectedCharacter != null)
        CharacterPage.page(character: selectedCharacter)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      home: FlowBuilder(
        state: context.watch<CharactersCubit>().state,
        onGeneratePages: onGeneratePages,
      ),
    );
  }
}
