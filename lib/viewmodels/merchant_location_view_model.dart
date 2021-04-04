
import 'package:driverapp/models/map_marker_model.dart';
import 'package:driverapp/serives/map_marker_service.dart';

class MerchantLocationViewModel {
  static final MerchantLocationViewModel _singleton = MerchantLocationViewModel._internal();
  factory MerchantLocationViewModel() {
    return _singleton;
  }
  MerchantLocationViewModel._internal();

  // Future<List<MerchantLocationModel>> _location;
  // Future<List<MerchantLocationModel>> get location => _location;
  //
  // set location( Future<List<MerchantLocationModel>> value) {
  //   _location = value;
  // }

  Future<List<MerchantLocationModel>> getMerchantLocation() {
    //location =
    return MapMarkerService().getMerchantLocation();
  }
}