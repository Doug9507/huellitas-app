//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitas_app/pages/global_widgets/main_drawer.dart';
import 'package:huellitas_app/pages/order/order_page.dart';
import 'package:huellitas_app/pages/product/product_page.dart';
//Package
import 'package:provider/provider.dart';
//Project
import 'package:huellitas_app/providers/order.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffFAF4FF),
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              CupertinoIcons.bars,
              color: Colors.black54,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
              print("appbar");
            },
          );
        }),
        backgroundColor: Color(0xffFAF4FF),
        title: Container(
          child: Image.asset(
            "assets/logo-huellitas-bg.png",
            height: 40,
            width: double.infinity,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.settings,
                color: Colors.black54,
              ),
              onPressed: () {
                // final route = MaterialPageRoute(builder: (_) => CartPage());
                // Navigator.push(context, route);
              })
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Mi pedido",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ...List.generate(order.detalle.length, (index) {
                  final detalle = order.detalle[index];
                  return OrderDetailCard(detalle: detalle);
                }),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text(
                      "S/.${order.montoTotal.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 200,
                    color: Color(0xf090910),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Text(
                        "Agregar más producto",
                        style: TextStyle(color: Colors.black),
                      ),
                      // color: Color(0xFF6F35A5),
                      onPressed: () {
                        // order.vaciarCarrito();
                        // print(order.detalle.length);
                        final route =
                            MaterialPageRoute(builder: (_) => ProductPage());
                        Navigator.push(context, route);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 300,
                    // color: Color(0xf090910),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Text(
                        "Continuar",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF6F35A5),
                      onPressed: () {
                        final route =
                            MaterialPageRoute(builder: (_) => OrderPage());
                        Navigator.push(context, route);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderDetailCard extends StatelessWidget {
  final OrderDetails detalle;

  OrderDetailCard({
    @required this.detalle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text("${detalle.cantidad}x"),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              "${detalle.nombreProducto}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )),
            Text("S/.${detalle.precio.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
