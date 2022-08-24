//Flutter
import 'package:flutter/material.dart';
//Package
import 'package:cached_network_image/cached_network_image.dart';
//Project
import 'package:huellitas_app/models/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  const PetCard({Key key, @required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int colorBg = int.parse("0xff${pet.color}");

    return GestureDetector(
      onTap: () {
        print("🍑");
        print(colorBg);
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          color: Color(colorBg),
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
            Row(
              children: [
                Text(
                  "Comprar para",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  pet.name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // child: Image.network(
                //   "${pet.image}",
                // ),
                child: CachedNetworkImage(
                  imageUrl: "${pet.image}",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
