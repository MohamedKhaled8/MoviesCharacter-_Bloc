// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:bloclearn/data/model/movies.dart';
// import 'package:bloclearn/data/repo/characters_repoimp.dart';
// // ignore_for_file: public_member_api_docs, sort_constructors_first

// part 'movies_state.dart';

// class MoviesCubit extends Cubit<MoviesState> {
//   final CharactersRepoImp repoImp;
//   List<MovieModel> moviesModel = [];
//   MoviesCubit(
//     this.repoImp,
//   ) : super(MoviesInitial());
//   Future<void> getAllCharacters() async {
//     try {
//       List<MovieModel> movies = await repoImp.getAllCharactersMovies();
//       emit(MoviesCharactersLoaded(movies));
//     } catch (error) {
//       emit(MoviesCharactersError(error.toString() as List<MovieModel>));
//     }
//   }
// }
