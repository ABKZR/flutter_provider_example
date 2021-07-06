
import 'package:flutter/foundation.dart';
import 'package:provider_practice/model/product_model.dart';

class CartController extends ChangeNotifier {
  List<Product> cartItems = [];
  //double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get count => cartItems.length;
  double totalCartValue = 0;


  void removeCard(index) {
    cartItems.removeAt(index);
    print(index);
    notifyListeners();
  }
  void removeProduct(product) {
    int index = cartItems.indexWhere((i) => i.id == product.id);
    cartItems[index].qty = 1;
    cartItems.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }
void updateProduct(product, qty) {
    int index = cartItems.indexWhere((i) => i.id == product.id);
    cartItems[index].qty = qty;
    if (cartItems[index].qty == 0)
      removeProduct(product);
   calculateTotal();
    notifyListeners();
  }
 void addProduct(product) {
    int index = cartItems.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1)
      updateProduct(product, product.qty + 1);
    else {
      cartItems.add(product);
      calculateTotal();
      notifyListeners();
    }
  }
    void calculateTotal() {
    totalCartValue = 0;
    cartItems.forEach((f) {
      totalCartValue += f.price * f.qty;
    });
  }
}
