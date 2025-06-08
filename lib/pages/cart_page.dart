import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(201, 240, 241, 241),
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: VxBuilder(
        mutations: {RemoveMutation},
        builder: (context, store, status) {
          print("Rebuild Happend");
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "\$${_cart.totalprice}".text.xl5
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              30.widthBox,
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying not supported yet".text.make()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: "Buy".text.white.make(),
              ).w(120),
            ],
          );
        },
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxConsumer(
      mutations: {RemoveMutation},
      builder: (context, store, _) {
        final CartModel _cart = (VxState.store as MyStore).cart;

        return _cart.items.isEmpty
            ? "Nothing to show".text.xl3.makeCentered()
            : ListView.builder(
              itemCount: _cart.items.length,
              itemBuilder:
                  (context, index) => ListTile(
                    leading: Icon(Icons.done),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => RemoveMutation(_cart.items[index]),
                    ),
                    title: _cart.items[index].name.text.make(),
                  ),
            );
      },
    );
  }
}
