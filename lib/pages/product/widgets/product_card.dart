//Flutter
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//Package

//Project
import 'package:huellitas_app/models/product.dart';
import 'package:huellitas_app/pages/product_detail/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("🍑");
        final route = MaterialPageRoute(
            builder: (_) => ProductDetailPage(
                  product: product,
                ));
        Navigator.push(context, route);
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 1,
            )
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: product.id,
                child: CachedNetworkImage(
                  imageUrl: "${product.productImage.first.url}",
                ),
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
