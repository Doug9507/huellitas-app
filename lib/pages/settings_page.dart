//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Project
import 'login/login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4FF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.arrowshape_turn_up_left,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
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
                CupertinoIcons.envelope,
                color: Colors.black54,
              ),
              onPressed: () {
                final route = MaterialPageRoute(builder: (_) => SettingsPage());
                Navigator.push(context, route);
              })
        ],
        backgroundColor: Color(0xffFAF4FF),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF6F35A5),
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (_) => LoginPage());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
