import 'package:driverapp/models/delivery_item_model.dart';
import 'package:driverapp/models/delivery_sheet_model.dart';
import 'package:driverapp/serives/delivery_service.dart';
import 'package:scoped_model/scoped_model.dart';

class DeliveryViewModel extends Model {
  static final DeliveryViewModel _singleton = DeliveryViewModel._internal();

  factory DeliveryViewModel() {
    return _singleton;
  }

  DeliveryViewModel._internal();

  List<DeliveryItemModel> _deliveries = [];

  List<DeliveryItemModel> get deliveries => _deliveries;

  set deliveries(List<DeliveryItemModel> value) {
    _deliveries = value;
  }

  // for()

  Future<List<DeliverySheetModel>> getDeliveries() {
    var tmp = DeliveryService().getDeliveries();
    return tmp;
  }

  Future<List<DeliveryItemModel>> getItemsInSheet() async {
    var tmp = await DeliveryService().getDeliveries();
    List<DeliveryItemModel> deliveryItems = [];
    tmp.map((e) {
      e.deliveryItems.map((e1) {
        deliveryItems.add(e1);
      });
      //deliveryItems.addAll();
    });
    return deliveryItems;
  }

  onGoing({String id}) {
    DeliveryService().isGoing(id: id);
    getDeliveries();
  }

  halfItemUpdate({
    dynamic collectedDollar,
    dynamic collectedRiel,
    String deliveredNote,
    String id,
    String note,
  }) {
    DeliveryService().halfItemUpdate(
      collectedDollar: collectedDollar,
      collectedRiel: collectedRiel,
      deliveredNote: deliveredNote,
      id: id,
      note: note,
    );
    getDeliveries();
  }

  provinceTransfer({
    String busOrTaxiBillPhoto,
    dynamic busOrTaxiFee,
    dynamic collectedDollar,
    dynamic collectedRiel,
    String companyName,
    String deliveredNote,
    String driverName,
    String id,
    String note,
    String phoneNumber,
    String type,
  }) {
    DeliveryService().provinceTransfer(
      busOrTaxiBillPhoto: busOrTaxiBillPhoto,
      busOrTaxiFee: busOrTaxiFee,
      collectedDollar: collectedDollar,
      collectedRiel: collectedRiel,
      companyName: companyName,
      deliveredNote: deliveredNote,
      driverName: driverName,
      id: id,
      note: note,
      phoneNumber: phoneNumber,
      type: type,
    );
    getDeliveries();
  }

  updateStatus({
    dynamic collectedDollar,
    dynamic collectedRiel,
    String deliveredNote,
    String expectedDeliveryTimeTo,
    String expectedDeliveryTimeFrom,
    String id,
    String note,
    String recontactDate,
    String recontactNote,
    String status,
  }) {
    DeliveryService().updateStatus(
        collectedDollar: collectedDollar,
        collectedRiel: collectedRiel,
        recontactDate: recontactDate,
        recontactNote: recontactNote,
        deliveredNote: deliveredNote,
        expectedDeliveryTimeFrom: expectedDeliveryTimeFrom,
        expectedDeliveryTimeTo: expectedDeliveryTimeTo,
        id: id,
        note: note,
        status: status);
    getDeliveries();
  }
}
