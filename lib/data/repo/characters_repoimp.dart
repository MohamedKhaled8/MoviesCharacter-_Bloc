import 'package:bloclearn/data/repo/repo.dart';
import 'package:bloclearn/data/model/qoute.dart';
import 'package:bloclearn/data/model/characters_model.dart';
import 'package:bloclearn/data/web_services/charcters_webservices.dart';

class CharactersRepoImp extends CharactersRepo {
  final CharactersWebServices charactersWebServices;
  final CharactersRepo? charactersRepo;

  CharactersRepoImp(
    this.charactersWebServices, {
    this.charactersRepo,
  });

  @override
  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      final List<Map<String, dynamic>> charactersData =
          (await charactersWebServices.getAllCharacters())
              .cast<Map<String, dynamic>>();

      return charactersData
          .map((character) => CharactersModel.fromJson(character))
          .toList();
    } catch (e) {
      print('حدث خطأ: $e');
      throw Exception('حدث خطأ أثناء جلب البيانات');
    }
  }

  @override
  Future<List<Quote>> getAllCharactersQuotes(List<Quote> quotes) async {
    return quotes;
  }

  // @override
  // Future<List<MovieModel>> getAllCharactersMovies() async {
  //   try {
  //     final List<dynamic> moviesData =
  //         (await charactersWebServices.getAllCharactersMovies());

  //     return moviesData
  //         .map((movieModel) => MovieModel.fromJson(movieModel))
  //         .toList();
  //   } catch (e) {
  //     print('حدث خطأ: $e');
  //     throw Exception('حدث خطأ أثناء جلب البيانات');
  //   }
  // }
}
