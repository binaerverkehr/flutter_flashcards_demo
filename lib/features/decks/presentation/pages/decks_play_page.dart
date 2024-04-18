import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/widgets/custom_flipcard.dart';

class DecksPlayPage extends StatefulWidget {
  const DecksPlayPage({
    Key? key,
    required this.deck,
  }) : super(key: key);

  final DeckEntity deck;

  @override
  State<DecksPlayPage> createState() => _DecksPlayPageState();
}

class _DecksPlayPageState extends State<DecksPlayPage> {
  late PageController _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    // Initialize the page controller with the current index
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the page controller
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deck.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 600,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.deck.cards.length,
              itemBuilder: (context, index) {
                final card = widget.deck.cards[index];
                return Center(
                  child: CustomFlipcard(frontText: card.front, backText: card.back),
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          // Text
          Text(
            '${currentIndex + 1} of ${widget.deck.cards.length}',
            style: const TextStyle(fontSize: 14),
          ),
          DotsIndicator(
            dotsCount: widget.deck.cards.length,
            position: currentIndex,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(9.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
