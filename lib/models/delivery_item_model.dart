class DeliveryItemModel {
  String id;
  String shopName;
  String customerName;
  String shopPhone;
  String customerPhone;
  String status;
  String address;
  String note;
  String barcode;
  int fromDate;
  int toDate;
  String paymentType;
  double priceDollar;
  double priceRiel;
  String deliveredNote;
  String recontactDate;
  String recontactNote;
  dynamic collectionDollar;
  dynamic collectionRiel;
  bool isGoing;

  String busOrTaxiBillPhoto;
  double busOrTaxiFee;
  double collectedDollar;
  double collectedRiel;
  String companyName;
  String driverName;
  String phoneNumber;
  String type;

  DeliveryItemModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['deliveryOrder']['sender']['name'];
    customerName = json['deliveryOrder']['receiver']['name'];
    shopPhone = json['deliveryOrder']['sender']['selectedPhoneNumber']['value'];
    customerPhone =
        json['deliveryOrder']['selectedReceiverPhoneNumber']['value'];
    status = json['deliveryOrder']['currentStatus'];
    note = json['deliveryOrder']['note'];
    barcode = json['deliveryOrder']['barCode'];
    fromDate = json['deliveryOrder']['expectedDeliveryTimeFrom'];
    toDate = json['deliveryOrder']['expectedDeliveryTimeTo'];
    paymentType = json['deliveryOrder']['paymentType'];
    priceDollar = json['deliveryOrder']['receiveAmountDollars'];
    priceRiel = json['deliveryOrder']['receiveAmountRiels'];
    isGoing = json['deliveryOrder']['isGoing'];
    collectionDollar = json['deliveryOrder']['collectedDollar'];
    collectionRiel = json['deliveryOrder']['collectedRiel'];
    busOrTaxiFee = json['deliveryOrder']['busOrTaxiFee'];
    busOrTaxiBillPhoto = json['deliveryOrder']['busOrTaxiBillPhoto'];
    deliveredNote = json['deliveryOrder']['deliveredNote'];
    //companyName = json['deliveryOrder']['bus']['companyName'];
    //driverName =
    // phoneNumber =
    // type =

    // if(isNotNull(json['deliveryOrder'])) {
    //   Map<String, dynamic> jsonNote = json['deliveryOrder'];
    //   note =
    //       "${checkNull(jsonNote['note'])}"
    //       "${checkNull(jsonNote['recontactNote'])}"
    //       .trim();
    // }

    if (isNotNull(json['deliveryOrder']['selectedReceiverAddress'])) {
      Map<String, dynamic> jsonAddress =
          json['deliveryOrder']['selectedReceiverAddress'];
      address = "${checkNull(jsonAddress['streetNumber'])}"
              "${checkNull(jsonAddress['streetName'], 'St.')}"
              "${checkNull(jsonAddress['houseNumber'], '#')}"
              "${checkNull(jsonAddress['sangkat'])}"
              "${checkNull(jsonAddress['khan'])}"
              "${checkNull(jsonAddress['other'])}"
          .trim();
    }
  }

  bool isNotNull(dynamic value) {
    return value != null;
  }

  checkNull(String value, [String prefix = '']) {
    return value != null ? "$prefix${value.trim()}, " : '';
  }
}
