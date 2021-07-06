class Product {
  final int id;
  final String productName;
  final String productDescription;
  final double price;
 int qty;

  Product(
      {required this.id,
      required this.productName,
      required this.productDescription,
      required this.price, this.qty =1});

  void toggleDone() {
    qty++;
  }
   void decreaseDown() {
    // ignore: unnecessary_statements
    qty == 0 ? 0 : qty--;
  }
}
