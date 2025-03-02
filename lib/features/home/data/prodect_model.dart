import '../../../gen/assets.gen.dart';

class Product {
  final int id;
  final String name;
  final String imagePath;
  final double price;

  Product(this.id, this.name, this.imagePath, this.price);
}

final List<Product> products = [
  Product(1, 'Cucumbers', Assets.images.cucumbers.path, 3.2),
  Product(2, 'Fresh garlic', Assets.images.garlic.path, 5.1),
  Product(3, 'Beet', Assets.images.beetRoot.path, 5.1),
  Product(4, 'Tomatoes', Assets.images.tomato.path, 5.1),
];
