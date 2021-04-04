import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/serives/map_service.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/pickup_status.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/viewModels/pickup_view_model.dart';
import 'package:driverapp/views/widgets/Popup/popup_status.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';

class PickupLocationPage extends StatefulWidget {
  final PickupModel pickup;
  PickupViewModel _viewModel;
  final String status;
  final Color color;

  PickupLocationPage({this.pickup, this.status, this.color}) {
    _viewModel = PickupViewModel();
  }

  @override
  _PickupLocationPageState createState() => _PickupLocationPageState();
}

class _PickupLocationPageState extends State<PickupLocationPage> {
  //map
  GoogleMapController mapController;
  Completer<GoogleMapController> _contoller = Completer();
  List<LatLng> _polyPoints = []; //for holding Co-ordinates as LatLng
  Set<Polyline> _polyLines = {}; //For holding instance of Polyline
  final Set<Marker> markers = Set<Marker>(); //For holding instance of Marker
  var data;
  Location _location = Location();
  LocationData currentLocation;
  LocationData destinationLocation;

  double _distant = 0;
  double _duration = 0;
  bool _isLoading = false;

  //LatLng
  double startLat = 11.577534;
  double startLng = 11.577534;
  final String number1 = '0966423566';
  final String number2 = '098809848';

  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setInitialLocation();
    destinationLocation = LocationData.fromMap({
      "latitude": widget.pickup.lat, //destLocation.latitude,
      "longitude": widget.pickup.lng //destLocation.longitude
    });
    setSourceAndDestinationIcons();
  }

  /**
   * This function is trigger by phone movement
   */
  void setInitialLocation() {
    //getJsonData();
    _location.onLocationChanged.listen((LocationData cLoc) {
      setState(() {
        currentLocation = cLoc;
        showMakersOnMap();
        updatePinOnMap();
      });
      getJsonData();
    });
  }

  void setSourceAndDestinationIcons() async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.0),
            "assets/icons/delivery-man.png")
        .then((onValue) {
      sourceIcon = onValue;
    });

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.0), "assets/icons/shop.png")
        .then((onValue) {
      destinationIcon = onValue;
    });
  }

  void showMakersOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    // get a LatLng out of the LocationData object
    var destPosition =
        LatLng(destinationLocation.latitude, destinationLocation.longitude);

    markers.add(Marker(
      markerId: MarkerId("sourcePin"),
      position: pinPosition,
      icon: sourceIcon,
    ));

    markers.add(Marker(
      markerId: MarkerId("destinationPin"),
      position: destPosition,
      icon: destinationIcon,
    ));
  }

  void upDatePolyLineOnMap() async {
    //if(_polyLines.length > 0) _polyLines ={}d;
    //if(_polyPoints.length > 0) _polyPoints = [];

    CameraPosition cPosition = CameraPosition(
      zoom: 15,
      tilt: 80,
      bearing: 30,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
    final GoogleMapController controller = await _contoller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      //sourcePinInfo.location = pinPosition;

      // the trick is to remove the last polyline (by id)
      // and add it again at the updated location
      _polyLines
          .removeWhere((element) => element.polylineId.value == 'polyLine');
      _polyLines.add(Polyline(
        polylineId: PolylineId('polyLine'),
        color: AppColor.MAIN_COLOR,
        points: _polyPoints,
        width: 5,
      ));
    });
  }

  void updatePinOnMap() async {
    CameraPosition cPosition = CameraPosition(
      zoom: 15,
      bearing: 30,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
    final GoogleMapController controller = await _contoller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);

      //sourcePinInfo.location = pinPosition;

      // the trick is to remove the last polyline (by id)
      // and add it again at the updated location
      markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition, // updated position
          icon: sourceIcon));
    });
  }

  void getJsonData() async {
    NetworkHelper network = NetworkHelper(
      startLat: currentLocation.latitude,
      startLng: currentLocation.longitude,
      endLat: widget.pickup.lat,
      endLng: widget.pickup.lng,
    );
    try {
      // getData() returns a json Decoded data
      data = await network.getData();

      var tpmDistant =
          data['features'][0]['properties']['summary']['duration'] / 60;
      var newDistant = _distant - tpmDistant;
      if (newDistant < 0) newDistant *= -1;
      if (_distant > 0 && newDistant < 6) return;

      _polyPoints = [];
      _polyLines = {};

      // We can reach to our desired JSON data manually as following
      LineString ls =
          LineString(data['features'][0]['geometry']['coordinates']);

      _distant =
          data['features'][0]['properties']['summary']['distance'] / 1000;
      _duration = tpmDistant;

      for (int i = 0; i < ls.lineString.length; i++) {
        _polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if (_polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }
      if (_isLoading) _isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  setPolyLines() {
    Polyline polyline = Polyline(
        polylineId: PolylineId("polyline"),
        color: AppColor.MAIN_COLOR,
        points: _polyPoints,
        width: 5);
    _polyLines.add(polyline);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
            title: Text(widget.pickup.name),
            backgroundColor: widget.pickup.status == PickupStatus.FAIL_TO_PICKUP
                ? AppColor.WARNING_COLOR.withOpacity(0.8)
                : AppColor.MAIN_COLOR,
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => Popup(onSubmit: (status) {
                      widget._viewModel.updateStatus(
                          currentStatus: status, id: widget.pickup.id);
                      //
                    }),
                  );
                },
              )
            ]),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.pickup.lat, widget.pickup.lng),
                zoom: 15,
              ),
              markers: markers,
              myLocationEnabled: true,
              polylines: _polyLines,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  // border: Border.all(width: 0, color: Colors.black26),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.WIHTE_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightGreenAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${widget.pickup.address}",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: (56.0 +
                    56.0), // bottom nav + it's height //MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                  color: AppColor.WIHTE_COLOR,
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(20),
                  //   topRight: Radius.circular(20),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${_duration.toStringAsPrecision(2)} ${TranslatorUtil.text("minute")}"),
                          Text(
                            '${_distant.toStringAsPrecision(2)} ${TranslatorUtil.text("kilometer")}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: AppColor.MAIN_COLOR,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: AppColor.WIHTE_COLOR,
                                ),
                                onPressed: () {
                                  _buildPopup((reason) {
                                    widget._viewModel.updateStatus(
                                        currentStatus:
                                            PickupStatus.FAIL_TO_PICKUP,
                                        id: widget.pickup.id,
                                        note: reason);
                                    Navigator.pop(
                                        context); // pop the popup dialog aways
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomStatus(widget.status, widget.pickup)
          ],
        ),
      ),
    );
  }

  _buildPopup(Function(String reason) onOk) {
    final _formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Form(
              key: _formKey,
              child: Container(
                height: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(TranslatorUtil.text('call'),
                          style: TextStyle(fontSize: 18)),
                    ),
                    FDottedLine(
                      strokeWidth: 1,
                      dottedLength: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCallButton(
                            TranslatorUtil.text('service'),
                            Icons.dialer_sip,
                            () => _callNumber('+85569984988')),
                        _buildCallButton(
                            TranslatorUtil.text('merchant'),
                            Icons.people,
                            () => _callNumber(widget.pickup.phone)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildBottomStatus(String status, PickupModel pickup) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: pickup.status == PickupStatus.FAIL_TO_PICKUP
              ? AppColor.WARNING_COLOR.withOpacity(0.8)
              : AppColor.MAIN_COLOR,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Text(
          //pickup.status,
          TranslatorUtil.text(pickup.status),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: AppColor.WIHTE_COLOR),
        ),
      ),
    );
  }

  _buildCallButton(String title, IconData icon, Function click) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        width: 115,
        height: 70,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          // onPressed: () => _service.call(number1),
          onPressed: () => click(),
          color: AppColor.MAIN_COLOR.withOpacity(1),
          disabledTextColor: AppColor.WARNING_COLOR.withOpacity(0.7),
          child: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 12, color: Colors.white.withOpacity(0.7)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

_callNumber(String number) async {
  bool res = await FlutterPhoneDirectCaller.callNumber(number);
}

//Create a new class to hold the Co-ordinates we've received from the response data
class LineString {
  LineString(this.lineString);

  List<dynamic> lineString;
}
