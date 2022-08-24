import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          // color: Color(0xffFAF4FF),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/PEREZ BARBARAN JAIME DOUGLAS.jpg",
                        height: 100,
                        // fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Douglas Perez",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          // fontFamily: "System-ui",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.house_alt),
                title: Text("Inicio"),
                onTap: () {
                  print("hello");
                },
              ),
              ListTile(
                leading: Icon(CupertinoIcons.square_favorites),
                title: Text("Mis pedidos"),
                onTap: () {},
                selected: true,
              ),
              ListTile(
                leading: Icon(CupertinoIcons.heart),
                title: Text("Mis favoritos"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
