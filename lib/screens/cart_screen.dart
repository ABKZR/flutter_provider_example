import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/controller/cart_controller.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartController = Provider.of<CartController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<CartController>(
                builder: (context, data, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartController.count,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(data.cartItems[index].productName),
                            subtitle:
                                Text(data.cartItems[index].productDescription),
                            trailing:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                onPressed: () {
                                  data.updateProduct(data.cartItems[index],(data.cartItems[index].qty)-1 );
                                },
                                icon: Icon(Icons.remove_circle_outline),
                              ),
                              Text(data.cartItems[index].qty.toString()),
                              IconButton(
                                onPressed: () {
                                  data.updateProduct(data.cartItems[index],(data.cartItems[index].qty)+1 );
                                },
                                icon: Icon(Icons.add_circle_outline),
                              )
                            ]),
                            leading: CircleAvatar(
                              child: Text((index + 1).toString()),
                              backgroundColor: Colors.blueGrey.shade200,
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            Consumer<CartController>(builder: (context, data, child) {
              return Text(
                'Total Rs. ${data.totalCartValue.toStringAsFixed(0)}',
                style: TextStyle(color: Colors.white, fontSize: 30),
              );
            }),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
