import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notjusthack_app/components/product_card.dart';
import 'package:notjusthack_app/models/product.dart';

class ProductSwiper extends StatefulWidget {
  const ProductSwiper({super.key});

  @override
  State<ProductSwiper> createState() => _ProductSwiperState();
}

class _ProductSwiperState extends State<ProductSwiper> {
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
    );
  }
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
      icon: Icon(Icons.close),
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
      icon: Icon(Icons.check),
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
