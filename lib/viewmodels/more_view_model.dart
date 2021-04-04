import 'package:driverapp/models/driver_model.dart';
import 'package:driverapp/serives/profile_service.dart';

class MoreViewModel {
  static final MoreViewModel _singleton = MoreViewModel._internal();
  factory MoreViewModel() {
    return _singleton;
  }
  MoreViewModel._internal();

  Future<DriverModel> _driver;
  Future<DriverModel> get driver => _driver;
  set driver(Future<DriverModel> value) {
    _driver = value;
  }

  getDriver() {
    driver = ProfileService().getProfile();
  }
}
