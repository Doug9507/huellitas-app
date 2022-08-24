import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huellitas_app/pages/address/helpers/image_to_byte.dart';
import 'package:huellitas_app/pages/address/utils/map_style13.dart';

class MapController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = CameraPosition(
    target: LatLng(-3.768687748739193, -73.28222167470305),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) async {
    _markers.clear();
    final markerId = MarkerId(_markers.length.toString());

    final icon = BitmapDescriptor.fromBytes(
        await assetTobyte('assets/logo-huellitas.jpeg'));

    final marker = Marker(
      icon: icon,
      markerId: markerId,
      position: position,
      onTap: () {
        print(markerId);
        print(position);
      },
      draggable: true,
      onDragEnd: (newPosition) {
        print(newPosition);
        position = newPosition;
      },
    );

    _markers[markerId] = marker;

    print(position);
    notifyListeners();
  }
}
