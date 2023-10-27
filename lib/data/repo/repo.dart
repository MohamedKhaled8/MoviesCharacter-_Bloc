import 'package:bloclearn/data/model/qoute.dart';
import 'package:bloclearn/data/model/characters_model.dart';

abstract class CharactersRepo {
  Future<List<CharactersModel>> getAllCharacters();
  Future<List<Quote>> getAllCharactersQuotes(List<Quote> quotes);
  // Future<List<dynamic>> getAllCharactersMovies();
}
