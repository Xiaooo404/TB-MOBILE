class Product {
  String id;
  String nama;
  int price;
  int qty;
  String attr;
  int weight;

  Product({
    required this.id,
    required this.nama,
    required this.price,
    required this.qty,
    required this.attr,
    required this.weight,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      nama: json['name'] as String,
      price: json['price'].toInt(), // Convert to integer (may cause truncation)
      qty: json['qty'].toInt(), // Convert to integer (may cause truncation)
      attr: json['attr'] as String,
      weight:
          json['weight'].toInt(), // Convert to integer (may cause truncation)
    );
  }
}
