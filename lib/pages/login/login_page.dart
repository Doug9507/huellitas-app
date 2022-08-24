//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Project
import 'package:huellitas_app/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isButtonEnable;
  String email = "dpbarbaran7@gmail.com";
  String password = "123";

  String inputEmail = "";
  String inputPassword = "";

  void route() {
    if (email == inputEmail && password == inputPassword) {
      final route = MaterialPageRoute(builder: (_) {
        // return HomePage();
        return HomePage();
      });
      Navigator.pushReplacement(context, route);
    }
  }

  @override
  void initState() {
    isButtonEnable = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xffFAF4FF),
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  "assets/main_top.png",
                  width: 150,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/login_bottom.png",
                  width: 270,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Image.asset("assets/logo-huellitas-bg.png"),
                    ),
                    Container(
                      width: 320,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1E6FF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.person,
                            color: Color(0xFF6F35A5),
                          ),
                          labelText: "Correo",
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                        ),
                        onChanged: (String texto) {
                          inputEmail = texto;
                          if (inputEmail.length > 0) {
                            isButtonEnable = true;
                            setState(() {});
                          } else {
                            isButtonEnable = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 320,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1E6FF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFF6F35A5),
                          ),
                          labelText: "Contraseña",
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                        ),
                        onChanged: (texto) {
                          inputPassword = texto;
                          if (inputPassword.length > 0) {
                            isButtonEnable = true;
                            setState(() {});
                          } else {
                            isButtonEnable = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            isButtonEnable ? "Ir a Home" : "Deshabilitado",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color(0xFF6F35A5),
                          onPressed: isButtonEnable ? this.route : null,
                          disabledColor: Colors.deepPurple.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
