import 'package:flutter/material.dart';
import 'package:huellitas_app/models/product.dart';
import 'package:huellitas_app/pages/product/widgets/product_card.dart';
import 'package:huellitas_app/services/product_service.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    Key key,
    @required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ScrollController _controller = ScrollController();
  List<Product> _products;
  int _pageNumber = 2;
  bool loading = false;

  @override
  void initState() {
    _products = widget.products;
    _controller.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        loading = true;
      });
      ProductService.getProducts(_pageNumber).then((value) {
        print("Page Number : ${value.pageNumber}");
        setState(() {
          _pageNumber = value.pageNumber + 1;
          _products.addAll(value.data);
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GridView.builder(
        controller: _controller,
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          final Product product = _products[i];
          return ProductCard(product: product);
        },
        itemCount: widget.products.length,
      ),
      if (loading)
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: RefreshProgressIndicator(),
            ),
          ),
        )
    ]);
  }
}
