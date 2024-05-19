class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int ratingCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'],
    title: json['title'],
    price: double.parse(json['price'].toString()), // String olarak gelen fiyatı double'a dönüştür
    description: json['description'],
    category: json['category'],
    image: json['image'],
    rating: double.parse(json['rating']['rate'].toString()), // String olarak gelen değeri double'a dönüştür
    ratingCount: json['rating']['count'],
  );
}

}
