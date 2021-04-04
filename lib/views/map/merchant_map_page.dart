import 'dart:async';
import 'dart:typed_data';

import 'package:driverapp/models/map_marker_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/viewmodels/merchant_location_view_model.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MerchantMapPage extends StatefulWidget {
  MerchantLocationViewModel _viewModel;

  MerchantMapPage() {
    _viewModel = MerchantLocationViewModel();
  }

  @override
  _MerchantMapPageState createState() => _MerchantMapPageState();
}

class _MerchantMapPageState extends State<MerchantMapPage> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController _mapController;
  Set<Marker> _markers = {}; //For holding instance of Marker
  LocationData _markerLocation;
  bool _isLoading = false;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<Position> _position;
  @override
  void initState() {
    super.initState();
    _position = Geolocator().getCurrentPosition();
    widget._viewModel.getMerchantLocation().then((datas) {
      Set<Marker> tmp = {};
      List.generate(datas.length, (index) {
        MerchantLocationModel item = datas[index];
        tmp.add(Marker(
            // onTap: _onMarkerTapped(markerId),
            markerId: MarkerId(item.id),
            position: LatLng(item.lat, item.lng),
            infoWindow:
                InfoWindow(title: item.name, snippet: item.description)));
      });

      Timer(Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
          _markers = tmp;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      isLoading: _isLoading,
      child: Scaffold(
          appBar: AppBar(
              title: Text(TranslatorUtil.text('merchantMap')),
              backgroundColor: AppColor.MAIN_COLOR,
              actions: []),
          body: FutureBuilder(
              builder: (context, positionSnap) {
                LatLng here = LatLng(11.5321721, 104.99425);
                if (positionSnap.data != null) {
                  here = LatLng(
                      positionSnap.data.latitude, positionSnap.data.longitude);
                  return GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: here,
                      zoom: 12,
                    ),
                    markers: _markers,
                    myLocationEnabled: true,
                  );
                }
                return Container();
              },
              future: _position)

          // Stack(
          //   children: [
          //     GoogleMap(
          //       onMapCreated: _onMapCreated,
          //       initialCameraPosition: CameraPosition(
          //         target: LatLng(11.5321721, 104.99425),
          //         zoom: 12,
          //       ),
          //       markers: _markers,
          //       myLocationEnabled: true,
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
