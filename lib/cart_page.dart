import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          elevation: 0,
        ),
        body: cart.isEmpty
            ? Center(
                child: Text(
                "Cart is Empty!",
                style: Theme.of(context).textTheme.titleMedium,
              ))
            : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(255, 210, 227, 240),
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage(cart[index]['imageUrl'] as String),
                      ),
                      title: Text(
                        cart[index]["title"] as String,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        "size: ${(cart[index]['sizes']).toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Remove Product",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  content: Text(
                                    "Do you wish to remove this product from the cart?",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "No",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(color: Colors.blue),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .removeItemFromCart(cart[index]);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Yes",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(color: Colors.red),
                                        )),
                                  ],
                                );
                              });
                          // Provider.of<CartProvider>(context, listen: false)
                          //     .removeItemFromCart(cart[index]);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                        ),
                        color: Colors.red,
                      ),
                    ),
                  );
                }));
  }
}
