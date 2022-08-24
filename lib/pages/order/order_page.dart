//Dart
//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitas_app/pages/address/address_page.dart';
//Project
import 'package:huellitas_app/pages/login/login_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _currentStep = 0;
  bool _pagoTarjeta = false;
  bool _pagoEfectivo = false;
  bool _recojoTienda = false;
  bool _delivery = false;

  List<Step> steps() => [
        Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          // title: Text("Forma de Pago"),
          title: Text("Método de Pago"),
          // subtitle: Text("Forma de Pago"),
          content: Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Tarjeta"),
                        SizedBox(
                          height: 8,
                        ),
                        FlatButton(
                          child: Text(
                            _pagoTarjeta ? "Seleccionado" : "Seleccionar",
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                    _pagoTarjeta ? Colors.white : Colors.black),
                          ),
                          color: _pagoTarjeta
                              ? Color(0xff998CEB)
                              : Color(0xf090910),
                          onPressed: () {
                            _pagoTarjeta = !_pagoTarjeta;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Efectivo"),
                        SizedBox(
                          height: 8,
                        ),
                        FlatButton(
                          // shape: ,
                          child: Text(
                            _pagoEfectivo ? "Seleccionado" : "Seleccionar",
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  _pagoEfectivo ? Colors.white : Colors.black,
                            ),
                          ),
                          color: _pagoEfectivo
                              ? Color(0xff998CEB)
                              : Color(0xf090910),
                          onPressed: () {
                            _pagoEfectivo = !_pagoEfectivo;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
          title: Text("Tipo de Entrega"),
          content: Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Recojo en Tienda"),
                        SizedBox(
                          height: 8,
                        ),
                        FlatButton(
                          child: Text(
                            _recojoTienda ? "Seleccionado" : "Seleccionar",
                            style: TextStyle(
                                fontSize: 12,
                                color: _recojoTienda
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          color: _recojoTienda
                              ? Color(0xff998CEB)
                              : Color(0xf090910),
                          onPressed: () {
                            _recojoTienda = !_recojoTienda;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Delivery"),
                        SizedBox(
                          height: 8,
                        ),
                        FlatButton(
                          // shape: ,
                          child: Text(
                            _delivery ? "Seleccionado" : "Seleccionar",
                            style: TextStyle(
                              fontSize: 12,
                              color: _delivery ? Colors.white : Colors.black,
                            ),
                          ),
                          color:
                              _delivery ? Color(0xff998CEB) : Color(0xf090910),
                          onPressed: () {
                            _delivery = !_delivery;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 2,
          title: Text("Detalle de Entrega"),
          content: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Dirección",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.lightBlue,
                      height: 80,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/img-restaurante.jpg",
                                height: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Principal",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Av. Guardia Civil 253 - Belen, Loreto.",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     IconButton(
                          //         color: Colors.black54,
                          //         icon: Icon(CupertinoIcons.forward),
                          //         onPressed: () {}),
                          //   ],
                          // )
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  final route = MaterialPageRoute(
                                      builder: (_) => AddressPage());
                                  Navigator.push(context, route);
                                },
                                child: Text(
                                  "Cambiar",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Datos del Cliente",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Douglas Perez",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "955700369",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4FF),
      drawer: Drawer(
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
      ),
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
                final route = MaterialPageRoute(builder: (_) => LoginPage());
                Navigator.push(context, route);
              })
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Color(0xFF6F35A5)),
          primaryColor: Color(0xFF6F35A5),
        ),
        child: Stepper(
          steps: steps(),
          currentStep: _currentStep,
          onStepContinue: () {
            final lastStep = _currentStep == steps().length - 1;
            if (lastStep) {
              print("Last Step ✔");
            } else {
              _currentStep++;
              setState(() {});
            }
          },
          onStepCancel: (_currentStep == 0)
              ? null
              : () {
                  _currentStep--;
                  setState(() {});
                },
          controlsBuilder: (_, {onStepContinue, onStepCancel}) {
            final lastStep = _currentStep == steps().length - 1;
            return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                child: Row(
                  children: [
                    if (_currentStep != 0)
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 80,
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Text(
                                "Regresar",
                                style: TextStyle(color: Colors.black),
                              ),
                              color: Color(0xf090910),
                              onPressed: onStepCancel,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 80,
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Text(
                              lastStep ? "Enviar Pedido" : "Continuar",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: lastStep
                                ? Color(0xFF6F35A5)
                                : Color(0xFF6F35A5).withOpacity(0.85),
                            onPressed: onStepContinue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
