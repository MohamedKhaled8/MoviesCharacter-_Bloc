import 'package:dio/dio.dart';
import 'package:bloclearn/core/constant/api.dart';

class CharactersWebServices {
  late Dio _dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,

      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 60 * 1000), // 60 seconds
      receiveTimeout: const Duration(milliseconds: 60 * 1000), // 60 seconds
    );
    _dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await _dio.get(Api.character);
      // List<dynamic> charactersData =
      //     List<dynamic>.from(response.data['results']);
      // return charactersData;
      return response.data['results'];
    } catch (e) {
      throw Exception('Failed to load characters');
    }
  }

  // Future<List<dynamic>> getAllCharactersMovies() async {
  //   try {
  //     Response response = await _dio.get(Api.movies);
  //     List<dynamic> charactersData = List<dynamic>.from(response.data['data']);
  //     return charactersData;
  //     // return response.data;
  //   } catch (e) {
  //     print('حدث خطأ: $e');
  //     throw Exception('Failed to load characters');
  //   }
  // }

  // Future<List<Quote>> getAllCharactersQuotes(List<Quote> quotes) async {
  //   return quotes;
  // }
}
