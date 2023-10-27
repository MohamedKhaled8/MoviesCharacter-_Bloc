import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloclearn/data/model/characters_model.dart';
import 'package:bloclearn/data/repo/characters_repoimp.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepoImp charactersRepoImp;
  List<CharactersModel> charactersModel = [];
  CharactersCubit(
    this.charactersRepoImp,
  ) : super(CharactersInitial());

// استقبل الي جي من repo
  Future<void> getAllCharacters() async {
    try {
      List<CharactersModel> characters =
          await charactersRepoImp.getAllCharacters();
      emit(CharactersLoaded(characters));
    } catch (error) {
      emit(CharactersError(error.toString()));
    }
  }

}
