import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String text;

  const Quote({required this.author, required this.text});

  @override
  List<Object?> get props => [author, text];

  @override
  String toString() => 'Quote(author: $author, text: $text)';
}
