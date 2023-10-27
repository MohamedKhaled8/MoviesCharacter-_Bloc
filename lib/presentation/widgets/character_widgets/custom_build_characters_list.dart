// import 'package:flutter/material.dart';
// import 'package:bloclearn/data/model/characters_model.dart';
// import 'package:bloclearn/presentation/widgets/custom_characters_items.dart';

// class CustomBuildCharactersList extends StatelessWidget {
//   final List<CharactersModel> allCharacters;
//   List<CharactersModel> searchForCharacters = [];
//   final TextEditingController _searchTextController = TextEditingController();

//   CustomBuildCharactersList({
//     Key? key,
//     required this.allCharacters,
//     // required this.searchForCharacters,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 2 / 3,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 1,
//         ),
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: _searchTextController.text.isEmpty
//             ? allCharacters.length
//             : searchForCharacters.length,
//         itemBuilder: (context, index) {
//           return CustomCharactersItems(
//             charactersModel: _searchTextController.text.isEmpty
//                 ? allCharacters[index]
//                 : searchForCharacters[index],
//           );
//         });
//   }
// }
