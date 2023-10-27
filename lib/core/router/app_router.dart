import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloclearn/core/constant/my_strings.dart';
import 'package:bloclearn/data/model/characters_model.dart';
import 'package:bloclearn/data/repo/characters_repoimp.dart';
import 'package:bloclearn/presentation/screens/characters_screen.dart';
import 'package:bloclearn/data/web_services/charcters_webservices.dart';
import 'package:bloclearn/core/business_logic/cubit/characters_cubit.dart';
import 'package:bloclearn/presentation/screens/character_details_screen.dart';
import 'package:bloclearn/core/business_logic/cubit/quote_characters_cubit.dart';

class AppRouter {
  late CharactersRepoImp charactersRepoImp;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepoImp = CharactersRepoImp(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepoImp);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: const CharactersScreen(),
                ));
      case characterDetailsScreen:
        final charactersModel = settings.arguments as CharactersModel;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => QuoteCharactersCubit(charactersRepoImp),
              child: CharacterDetailsScreen(
                charactersModel: charactersModel,
              ),
            );
          },
        );
    }
    return null;
  }
}