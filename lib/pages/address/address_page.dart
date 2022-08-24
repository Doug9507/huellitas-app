import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huellitas_app/pages/address/utils/map_controller.dart';
import 'package:huellitas_app/pages/global_widgets/main_appbar.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<MapController>(context);

    return Scaffold(
      appBar: MainAppBar(),
      body: GoogleMap(
        initialCameraPosition: _controller.initialCameraPosition,
        onMapCreated: _controller.onMapCreated,
        // onTap: _controller.onTap,
        onTap: (latLng) {
          _controller.onTap(latLng);
          showModalBottomSheet(
            // barrierColor: Colors.transparent,
            context: context,
            builder: (_) => SizedBox(
              height: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Confirma tu dirección"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Dirección elegida..."),
                        TextButton(
                          onPressed: () {
                            print("confirmado!");
                          },
                          child: Text("Confirmar"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
          );
        },
        markers: _controller.markers,
      ),
    );
  }
}
