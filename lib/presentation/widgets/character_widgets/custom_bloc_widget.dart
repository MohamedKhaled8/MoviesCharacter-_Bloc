// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloclearn/data/model/characters_model.dart';
// import 'package:bloclearn/core/business_logic/cubit/characters_cubit.dart';
// import 'package:bloclearn/presentation/widgets/custom_loaded_indecator.dart';
// import 'package:bloclearn/presentation/widgets/custom_build_loaded_list_widget.dart';

// // ignore: must_be_immutable
// class CustomBlocWidgets extends StatelessWidget {
//   CustomBlocWidgets({super.key});
//   List<CharactersModel> allCharacters = [];
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CharactersCubit, CharactersState>(
//       builder: (context, state) {
//         if (state is CharactersLoaded) {
//           List<CharactersModel> allCharacters = state.charactersModel;
//           return CustomBuildLoadedListWidgets(allCharacters: allCharacters);
//         } else if (state is CharactersError) {
//           return Center(
//             child: Text('Error: ${state.error}'),
//           );
//         } else {
//           return const CustomLoadingIndectaor();
//         }
//       },
//     );
//   }
// }
