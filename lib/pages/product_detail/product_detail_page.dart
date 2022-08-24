//Dart
import 'dart:ui';
//Flutter
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitas_app/pages/global_widgets/main_drawer.dart';
//Package
import 'package:provider/provider.dart';
//Project
import 'package:huellitas_app/models/product.dart';
import 'package:huellitas_app/pages/cart/cart_page.dart';
import 'package:huellitas_app/providers/order.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isSelected = false;
  int _cantidad = 1;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);
    return Scaffold(
      // backgroundColor: Color(0xffFAF4FF),
      backgroundColor: Colors.white,
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
            },
          );
        }),
        // backgroundColor: Color(0xffFAF4FF),
        backgroundColor: Colors.white,
        title: Container(
          child: Image.asset(
            "assets/logo-huellitas-bg.png",
            height: 40,
            width: double.infinity,
          ),
        ),
        actions: [
          IconButton(
              icon: (order.detalle.length > 0)
                  ? Icon(
                      CupertinoIcons.cart_fill_badge_plus,
                      color: Color(0xFF6F35A5),
                    )
                  : Icon(
                      CupertinoIcons.cart,
                      color: Colors.black54,
                    ),
              onPressed: () {
                final route = MaterialPageRoute(builder: (_) => CartPage());
                Navigator.push(context, route);
              })
        ],
      ),
      body: Builder(
        builder: (context) => SafeArea(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Hero(
                tag: widget.product.id,
                child: CachedNetworkImage(
                  imageUrl: "${widget.product.productImage.first.url}",
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffFAF4FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6F35A5),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              icon: _isSelected
                                  ? Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.red[800],
                                    )
                                  : Icon(
                                      CupertinoIcons.heart,
                                      color: Colors.red[800],
                                    ),
                              onPressed: () {
                                print("👀");
                                _isSelected = !_isSelected;
                                setState(() {
                                  print(_isSelected);
                                });
                              })
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(widget.product.description),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            color: Color(0xf090910),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  child: Icon(CupertinoIcons.minus),
                                  // color: Color(0xFF6F35A5),
                                  onPressed: () {
                                    if (_cantidad != 1) {
                                      _cantidad--;
                                      setState(() {});
                                      print(_cantidad);
                                    }
                                    print(_cantidad);
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _cantidad.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FlatButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  child: Icon(CupertinoIcons.plus),
                                  // color: Color(0xFF6F35A5),
                                  onPressed: () {
                                    _cantidad++;
                                    setState(() {});
                                    print(_cantidad);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "S/. ${widget.product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: 150,
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                child: Text(
                                  "Agregar al carrito",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color(0xFF6F35A5),
                                onPressed: () {
                                  print("🎁");
                                  OrderDetails detalle = OrderDetails();
                                  detalle.nombreProducto = widget.product.name;
                                  detalle.cantidad = _cantidad;
                                  detalle.precio = widget.product.price;
                                  detalle.subtotal =
                                      _cantidad * widget.product.price;
                                  order.detalle = detalle;
                                  print(order.detalle.length);

                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        children: [
                                          Icon(Icons.check_circle),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Producto agregado al carrito!"),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
