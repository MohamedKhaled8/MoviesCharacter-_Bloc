import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloclearn/core/constant/qoutes.dart';
import 'package:bloclearn/core/constant/my_color.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloclearn/data/model/characters_model.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final CharactersModel charactersModel;

  const CharacterDetailsScreen({
    Key? key,
    required this.charactersModel,
  }) : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  int currentQuoteIndex = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        currentQuoteIndex = Random().nextInt(BreakingBadQuotes.quotes.length);
      });
    });
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: MyColors.myGrey,
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.charactersModel.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
            tag: widget.charactersModel.id,
            child: Image.network(
              widget.charactersModel.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          TextSpan(
              text: value,
              style: const TextStyle(color: MyColors.myWhite, fontSize: 16))
        ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget displayRandomQuoteOrEmptySpace() {
    if (BreakingBadQuotes.quotes.isNotEmpty) {
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.myYellow,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(BreakingBadQuotes.quotes[currentQuoteIndex]),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          //الشق الي تحت
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo(
                      'origin : ',
                      widget.charactersModel.origin.name.splitMapJoin(' / '),
                    ),
                    buildDivider(315),
                    characterInfo(
                      'species : ',
                      widget.charactersModel.species,
                    ),
                    buildDivider(278),
                    characterInfo(
                      'status : ',
                      widget.charactersModel.status,
                    ),
                    buildDivider(290),
                    characterInfo(
                      'gender : ',
                      widget.charactersModel.gender,
                    ),
                    buildDivider(280),
                    widget.charactersModel.type.isEmpty
                        ? const SizedBox()
                        : characterInfo(
                            'type : ',
                            widget.charactersModel.type,
                          ),
                    widget.charactersModel.type.isEmpty
                        ? const SizedBox()
                        : buildDivider(150),
                    characterInfo(
                      'Name : ',
                      widget.charactersModel.name,
                    ),
                    buildDivider(290),
                    const SizedBox(
                      height: 20,
                    ),
                    displayRandomQuoteOrEmptySpace(),
                  ]),
            ),
            const SizedBox(
              height: 500,
            ),
          ]))
        ],
      ),
    );
  }
}
