import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:notjusthack_app/components/product_card.dart';
import 'package:notjusthack_app/models/product.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final AppinioSwiperController controller = AppinioSwiperController();

  List<Product> productList = [
    Product(
      name: "Product 1",
      distance: "10 km",
      imageAsset: "assets/images/product1.png",
    ),
    Product(
      name: "Product 2",
      distance: "5 km",
      imageAsset: "assets/images/product2.png",
    ),
    Product(
      name: "Product 3",
      distance: "8 km",
      imageAsset: "assets/images/product3.png",
    ),
    Product(
      name: "Product 4",
      distance: "12 km",
      imageAsset: "assets/images/product4.png",
    ),
    Product(
      name: "Product 5",
      distance: "15 km",
      imageAsset: "assets/images/product5.png",
    ),
    Product(
      name: "Product 6",
      distance: "3 km",
      imageAsset: "assets/images/product6.png",
    ),
  ];

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('UrbanUnbox'))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Businesses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
      body: CupertinoPageScaffold(
        child: Stack(
          children: [
            AppinioSwiper(
              padding: EdgeInsets.all(0),
              backgroundCardsCount: 3,
              swipeOptions: const AppinioSwipeOptions.all(),
              unlimitedUnswipe: true,
              controller: controller,
              unswipe: _unswipe,
              onSwiping: (AppinioSwiperDirection direction) {
                debugPrint(direction.toString());
              },
              onSwipe: _swipe,
              onEnd: _onEnd,
              cardsCount: productList.length,
              cardsBuilder: (BuildContext context, int index) {
                return ProductCard(product: productList[index]);
              },
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  swipeLeftButton(controller, context),
                  const SizedBox(
                    width: 30,
                  ),
                  swipeRightButton(controller, context),
                  const SizedBox(
                    width: 30,
                  ),
                  unswipeButton(controller, context),
                ],
              ),
            ),
          ],
        ),
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

Widget swipeLeftButton(
    AppinioSwiperController controller, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () {
        controller.swipeLeft();
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.white,
    ),
  );
}

Widget swipeRightButton(
    AppinioSwiperController controller, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () {
        controller.swipeRight();
      },
      icon: Icon(Icons.arrow_forward),
      color: Colors.white,
    ),
  );
}

Widget unswipeButton(AppinioSwiperController controller, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () {
        controller.unswipe();
      },
      icon: Icon(Icons.undo),
      color: Colors.white,
    ),
  );
}
