import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitas_app/pages/cart/cart_page.dart';
import 'package:huellitas_app/providers/order.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({Key key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);

    return AppBar(
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
    );
  }
}
