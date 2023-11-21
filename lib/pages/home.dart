import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final AppinioSwiperController controller = AppinioSwiperController();

  final List<String> candidates = [
    "Candidate 1",
    "Candidate 2",
    "Candidate 3",
    "Candidate 4",
    "Candidate 5",
    "Candidate 6",
    "Candidate 7",
    "Candidate 8",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AppinioSwiper(
              backgroundCardsCount: 3,
              swipeOptions: const AppinioSwipeOptions.all(),
              unlimitedUnswipe: true,
              controller: controller,
              unswipe: _unswipe,
              onSwiping: (AppinioSwiperDirection direction) {
                debugPrint(direction.toString());
              },
              onSwipe: _swipe,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 50,
                bottom: 40,
              ),
              onEnd: _onEnd,
              cardsCount: candidates.length,
              cardsBuilder: (BuildContext context, int index) {
                return ExampleCard(candidate: candidates[index]);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 80,
              ),
              swipeLeftButton(controller),
              const SizedBox(
                width: 20,
              ),
              swipeRightButton(controller),
              const SizedBox(
                width: 20,
              ),
              unswipeButton(controller),
            ],
          )
        ],
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    print("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      print("SUCCESS: card was unswiped");
    } else {
      print("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    print("end reached!");
  }
}

class ExampleCard extends StatelessWidget {
  final String candidate;

  const ExampleCard({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Customize your card UI here
      child: Container(
        child: Text(candidate),
        color: Colors.amber,
      ),
    );
  }

  // Add any additional functionality for the card here
}

Widget swipeLeftButton(AppinioSwiperController controller) {
  return ElevatedButton(
    onPressed: () {
      controller.swipeLeft();
    },
    child: const Text('Swipe Left'),
  );
}

Widget swipeRightButton(AppinioSwiperController controller) {
  return ElevatedButton(
    onPressed: () {
      controller.swipeRight();
    },
    child: const Text('Swipe Right'),
  );
}

Widget unswipeButton(AppinioSwiperController controller) {
  return ElevatedButton(
    onPressed: () {
      controller.unswipe();
    },
    child: const Text('Unswipe'),
  );
}
