class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: "iphone 12 pro",
      desc: "Apple iphone 12th geenration",
      price: 999,
      color: "33505a",
      image: "https://pngimg.com/uploads/iphone_12/iphone_12_PNG36.png",
    ),
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}
