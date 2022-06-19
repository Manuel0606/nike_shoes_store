import 'package:flutter/material.dart';
import 'package:nike_shoes_store/nike_shoes_store_app/nike_shoes.dart';

class NikeShoesDetails extends StatelessWidget {

  NikeShoesDetails({Key? key, required this.shoes}) : super(key: key);
  
  final NikeShoes shoes;
  final ValueNotifier<bool> notifierButtomsVisible = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierButtomsVisible.value = true;
    });
    
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          ValueListenableBuilder<bool>(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'fav_1',
                    child: const Icon(Icons.favorite_border, color: Colors.black,),
                    onPressed: () {},
                    backgroundColor: Colors.white,
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    heroTag: 'fav_2',
                    child: const Icon(Icons.shopping_bag),
                    onPressed: () {},
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            valueListenable: notifierButtomsVisible,
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                duration: const Duration(milliseconds: 200),
                child: child!,
              );
            }
          ),
        ],
      ),
    );
  }
}
