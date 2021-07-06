import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/controller/cart_controller.dart';
import 'package:provider_practice/model/product_data.dart';
import 'package:provider_practice/screens/cart_screen.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var product = ProductData();

  var cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: product.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        product.products[index].productName,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        product
                                            .products[index].productDescription,
                                      ),
                                    ],
                                  ),
                                  Text('Rs. ${product.products[index].price}')
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Provider.of<CartController>(context,
                                            listen: false)
                                        .addProduct(product.products[index]);
                                  },
                                  child: Text('Add to Cart')),
                            ],
                          ),
                        ),
                      );
                    })),
          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amberAccent,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage()));
        }, label: Consumer<CartController>(
          builder: (context,data,child){
            return  Text(data.count.toString()); 
          })
          ,icon:Icon( Icons.shopping_cart_outlined,color: Colors.white,),),
    );
  }
}
