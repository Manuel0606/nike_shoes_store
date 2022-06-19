class NikeShoes {
  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.images,
    required this.modelNumber,
    required this.color
  });

  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

}

final shoes = <NikeShoes>[
  NikeShoes(
    model: "Nike Air Force 1 '07",
    oldPrice: 139.99,
    currentPrice: 109.99,
    images: [
      'assets/nike_shoes_store/shoes1_1.png',
      'assets/nike_shoes_store/shoes1_2.png',
      'assets/nike_shoes_store/shoes1_3.png',
      'assets/nike_shoes_store/shoes1_4.png',
      'assets/nike_shoes_store/shoes1_5.png',
    ],
    modelNumber: 001,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: "Air Jordan 1 Mid",
    oldPrice: 149.99,
    currentPrice: 129.99,
    images: [
      'assets/nike_shoes_store/shoes2_1.png',
      'assets/nike_shoes_store/shoes2_2.png',
      'assets/nike_shoes_store/shoes2_3.png',
      'assets/nike_shoes_store/shoes2_4.png',
      'assets/nike_shoes_store/shoes2_5.png',
    ],
    modelNumber: 001,
    color: 0xFFEDF3FD, //FAF5EB
  ),
  NikeShoes(
    model: "Nike Air Max Terrascape Plus",
    oldPrice: 199.99,
    currentPrice: 179.99,
    images: [
      'assets/nike_shoes_store/shoes3_1.png',
      'assets/nike_shoes_store/shoes3_2.png',
      'assets/nike_shoes_store/shoes3_3.png',
      'assets/nike_shoes_store/shoes3_4.png',
      'assets/nike_shoes_store/shoes3_5.png',
    ],
    modelNumber: 100,
    color: 0xFFFEF7ED, //FEF7ED
  ),
  NikeShoes(
    model: "Nike Air Max 97",
    oldPrice: 199.99,
    currentPrice: 179.99,
    images: [
      'assets/nike_shoes_store/shoes4_1.png',
      'assets/nike_shoes_store/shoes4_2.png',
      'assets/nike_shoes_store/shoes4_3.png',
      'assets/nike_shoes_store/shoes4_4.png',
      'assets/nike_shoes_store/shoes4_5.png',
    ],
    modelNumber: 97,
    color: 0xFFE7E7E7,
  ),
];