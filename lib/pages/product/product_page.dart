//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitas_app/pages/cart/cart_page.dart';
import 'package:huellitas_app/pages/global_widgets/main_drawer.dart';
import 'package:huellitas_app/pages/product/widgets/product_list.dart';
// import 'package:huellitas_app/pages/global_widgets/main_drawer.dart';
// import 'package:huellitas_app/pages/product/widgets/product_list.dart';
//Package
import 'package:provider/provider.dart';
//Project
import 'package:huellitas_app/models/product.dart';
// import 'package:huellitas_app/pages/cart/cart_page.dart';
import 'package:huellitas_app/providers/order.dart';
import 'package:huellitas_app/services/product_service.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<ReqProductResponse> _response;
  int _pageNumber = 1;

  @override
  void initState() {
    super.initState();
    _response = ProductService.getProducts(_pageNumber);
  }

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
      body: SafeArea(
        child: FutureBuilder(
          future: _response,
          builder: (context, AsyncSnapshot<ReqProductResponse> snapshot) {
            if (snapshot.hasData) {
              return ProductList(products: snapshot.data.data);
            }

            return Padding(
              padding: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
