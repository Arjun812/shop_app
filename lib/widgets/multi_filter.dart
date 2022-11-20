// enum ProductFilter { Brand, Rating }

// enum Weight { HEAVY, NORMAL, LIGHT }
//
// enum Shape { SQUARE, ROUND, TRIANGLE }

class Product {
  final String? brand;
  final int? rating;
  Product({

    this.brand,
    this.rating,
  });
  @override
  String toString() {
    return '$brand $rating';
  }
}

class Query {
  final List<String>? brand;
  final List<int>? rating;

  Query( {this.brand, this.rating,});
}

List<Product> multiFilter(List<Product> products, Query query) {
  return products
      .where((product) =>
  (query.brand == null || query.brand!.contains(product.brand)) &&
      (query.rating == null || query.rating!.contains(product.rating)))
      .toList();
}