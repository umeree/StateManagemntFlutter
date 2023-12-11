import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateamnagement/provider/Cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [Expanded(child: ItemList()), ShoppingCart()]),
      ),
    );
  }
}

//Components for Cart
class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> allItems = [
      "Orange",
      "Banana",
      "Guava",
      "Grape",
      "Mango",
      "Peach"
    ];
    final cartProvider = Provider.of<CartModel>(context, listen: false);
    return ListView.builder(
        itemCount: allItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              cartProvider.additems(allItems[index]);
              print(cartProvider.items);
            },
            title: Text(allItems[index]),
            trailing: Container(
              width: 50,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              )),
            ),
          );
        });
  }
}

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Shopping Cart",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 8,
            ),
            Consumer<CartModel>(builder: (context, value, children) {
              List<String> cartItems = value.items;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(cartItems.length, (index) {
                    String item = cartItems[index];
                    return ListTile(
                      title: Text(item),
                      trailing: Icon(Icons.remove),
                      onTap: () {
                        Provider.of<CartModel>(context, listen: false)
                            .removeItems(item);
                        print(cartItems);
                      },
                    );
                  }));
            })
          ],
        ),
      ),
    );
  }
}
