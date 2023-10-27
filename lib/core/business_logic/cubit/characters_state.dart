// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharactersModel> charactersModel;
  const CharactersLoaded(
    this.charactersModel,
  );
}

class CharactersError extends CharactersState {
  final String error;

  const CharactersError(this.error);
}
