//Dart
import 'dart:ui';
//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitas_app/pages/global_widgets/main_appbar.dart';
//Package
import 'package:cached_network_image/cached_network_image.dart';
//Project
import 'package:huellitas_app/models/pet.dart';
import 'package:huellitas_app/pages/global_widgets/main_drawer.dart';
import 'package:huellitas_app/pages/product/product_page.dart';
import 'package:huellitas_app/services/pet_service.dart';
import 'package:huellitas_app/pages/home/widgets/pet_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ReqPetResponse> response;

  @override
  void initState() {
    super.initState();
    response = PetService.getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4FF),
      drawer: MainDrawer(),
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  print("👀");
                  final route =
                      MaterialPageRoute(builder: (context) => ProductPage());
                  Navigator.push(context, route);
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff53B8BB),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop),
                        image: CachedNetworkImageProvider(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWMRQN64vJUa2eZ6UNwrToxP-NVajgxaAq_w&usqp=CAU"),
                        fit: BoxFit.cover,
                      )),
                  child: Center(
                    child: Text(
                      "Novedades",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Comprar producto:",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 150,
              child: FutureBuilder(
                future: response,
                builder: (context, AsyncSnapshot<ReqPetResponse> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      // physics: ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (context, i) {
                        final Pet pet = snapshot.data.data[i];
                        return PetCard(pet: pet);
                      },
                    );
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Vuelve a pedir:",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Color(0xff035397),
                child: Center(
                  child: Text(
                    "Historial",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
