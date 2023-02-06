import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/characters_cubit.dart';
import 'my_app.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CharactersCubit()..fetchCharacterLinks(),
      child: const MyApp(),
    ),
  );
}
