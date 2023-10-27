part of 'quote_characters_cubit.dart';

abstract class QuoteCharactersState extends Equatable {
  const QuoteCharactersState();

  @override
  List<Object> get props => [];
}

final class QuoteCharactersInitial extends QuoteCharactersState {}

class QuoteCharactersLoaded extends QuoteCharactersState {
  final List<Quote> charactersQuote;

  const QuoteCharactersLoaded(this.charactersQuote);
}

class QuoteCharactersError extends QuoteCharactersState {
  final List<Quote> errorQuote;

  const QuoteCharactersError(this.errorQuote);
}
