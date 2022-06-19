//import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nike_shoes_store/nike_shoes_store_app/nike_shoes.dart';
import 'package:nike_shoes_store/nike_shoes_store_app/nike_shoes_details.dart';

class MainNikeShoesStore extends StatelessWidget {
  const MainNikeShoesStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: NikeShoesStoreHome(),
    );
  }
}

class NikeShoesStoreHome extends StatelessWidget {
  NikeShoesStoreHome({Key? key}) : super(key: key);

  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoesDetails(
              shoes: shoes,
            ),
          );
        },
      ),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'assets/nike_shoes_store/nike_logo.png',
                    height: 40,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      dragStartBehavior: DragStartBehavior.start,
                      itemCount: shoes.length,
                      padding: const EdgeInsets.only(bottom: 40),
                      itemBuilder: (context, index) {
                        final shoesItem = shoes[index];
                        return NikeShoesItem(
                          shoesItem: shoesItem,
                          onTap: () {
                            _onShoesPressed(shoesItem, context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: notifierBottomBarVisible,
                child: Container(
                  color: Colors.white.withOpacity(0.7),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Icon(Icons.home),
                      ),
                      Expanded(
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: Icon(Icons.favorite_border),
                      ),
                      Expanded(
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                      Expanded(
                        child: Center(
                          child: CircleAvatar(
                            radius: 13,
                            backgroundImage: AssetImage(
                                'assets/nike_shoes_store/avatar.jfif'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                builder: (context, value, child) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    height: kToolbarHeight,
                    child: child!,
                  );
                })
          ],
        ));
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoesItem;
  final VoidCallback onTap;

  const NikeShoesItem({Key? key, required this.shoesItem, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(shoesItem.color),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: itemHeight * 0.6,
                  child: FittedBox(
                    child: Text(
                      shoesItem.modelNumber.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.05),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 120,
                height: itemHeight * 0.31,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-35 / 360),
                  child: Image.asset(
                    shoesItem.images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                bottom: 20,
                left: 20,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
              const Positioned(
                bottom: 20,
                right: 20,
                child: Icon(
                  Icons.shopping_bag_outlined, //shopping_bag_outlined
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      shoesItem.model,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${shoesItem.oldPrice.toInt().toString()}',
                      style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${shoesItem.currentPrice.toInt().toString()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
