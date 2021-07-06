
import 'package:provider_practice/model/product_model.dart';
class ProductData{
 List<Product> products = [
      Product(
          id: 0,
          productName: 'FirstProduct',
          productDescription: 'Some Product Description',
          price: 100.0,
          qty: 1,
          ),
           Product(
          id: 1,
          productName: 'SecondProduct',
          productDescription: 'Some Product Description',
          price: 200.0,
          qty: 1),
           Product(
          id: 2,
          productName: 'ThirdProduct',
          productDescription: 'Some Product Description',
          price: 230.0,qty: 1),
    ];  
}