import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloclearn/data/model/qoute.dart';
import 'package:bloclearn/data/repo/characters_repoimp.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

part 'quote_characters_state.dart';

class QuoteCharactersCubit extends Cubit<QuoteCharactersState> {
  final CharactersRepoImp repoImp;

  QuoteCharactersCubit(
    this.repoImp,
  ) : super(QuoteCharactersInitial());

  Future<void> getAllQuoteCharacters(List<Quote> quotes) async {
    try {
      List<Quote> characters = await repoImp.getAllCharactersQuotes(quotes);
      emit(QuoteCharactersLoaded(characters));
    } catch (error) {
      emit(QuoteCharactersError(error.toString() as List<Quote>));
    }
  }
}
