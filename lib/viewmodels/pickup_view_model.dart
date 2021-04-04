import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/serives/pickup_service.dart';
import 'package:scoped_model/scoped_model.dart';

class PickupViewModel extends Model {
  static final PickupViewModel _singleton = PickupViewModel._internal();

  factory PickupViewModel() {
    return _singleton;
  }

  PickupViewModel._internal();

  List<PickupModel> _pickups = [];

  List<PickupModel> get pickups => _pickups;

  set pickups(List<PickupModel> value) {
    _pickups = value;
  }

  Future<List<PickupModel>> getPickups() {
    return PickupService().getPickups(); //return PickupService().getPickups();
  }

  updateStatus({String currentStatus, String id, String note}) {
    PickupService()
        .updateStatus(currentStatus: currentStatus, id: id, note: note);
    getPickups();
  }
}
