class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      name: json['name']);
  Map<String, dynamic> toJson() => {
        'name': name,
        'image': imageUrl,
        'price': price,
        'description': description
      };
}
