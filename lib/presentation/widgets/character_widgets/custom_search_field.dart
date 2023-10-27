import 'package:flutter/material.dart';
import 'package:bloclearn/core/constant/my_color.dart';
import 'package:bloclearn/data/model/characters_model.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  List<CharactersModel> allCharacters = [];
  List<CharactersModel> searchForCharacters = [];
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
          hintText: 'find a character...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18)),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchCharacters) {
        addSearchForItemsSearchList(searchCharacters);
        setState(() {});
      },
    );
  }

  void addSearchForItemsSearchList(String searchCharacters) {
    searchForCharacters = allCharacters
        .where((characters) =>
            characters.name.toLowerCase().startsWith(searchCharacters))
        .toList();
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }
  _clearSearching () {
    setState(() {
      _searchTextController.clear();
    });
  }
}
