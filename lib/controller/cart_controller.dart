
import 'package:flutter/foundation.dart';
import 'package:provider_practice/model/product_model.dart';

class CartController with ChangeNotifier {
  var cartItems = <Product>[];
 int price=0;
  double get totalPrice {return 
  cartItems.fold(0, (sum, item) =>sum+ item.price);
  
}
int get count {return cartItems.length;}


  addToCart(Product products) {
    cartItems.add(products);
  notifyListeners();
    
  }

}
