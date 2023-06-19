class Album {
  Apppartment? apppartment;
  Information? information;

  Album({apppartment, information});

  Album.fromJson(Map<String, dynamic> json) {
    apppartment = json['apppartment'] != null
        ? Apppartment.fromJson(json['apppartment'])
        : null;
    information = json['information'] != null
        ? Information.fromJson(json['information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (apppartment != null) {
      data['apppartment'] = apppartment!.toJson();
    }
    if (information != null) {
      data['information'] = information!.toJson();
    }
    return data;
  }
}

class Apppartment {
  String? address;
  String? agency;
  String? createdAt;
  String? description;
  int? id;
  String? name;
  String? phonenumber;
  int? postalCode;
  double? price;
  String? ref;
  double? squareMeter;
  String? url;

  Apppartment(
      {address,
      agency,
      createdAt,
      description,
      id,
      name,
      phonenumber,
      postalCode,
      price,
      ref,
      squareMeter,
      url});

  Apppartment.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    agency = json['agency'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    name = json['name'];
    phonenumber = json['phonenumber'];
    postalCode = json['postal_code'];
    price = json['price'];
    ref = json['ref'];
    squareMeter = json['square_meter'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address'] = address;
    data['agency'] = agency;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['id'] = id;
    data['name'] = name;
    data['phonenumber'] = phonenumber;
    data['postal_code'] = postalCode;
    data['price'] = price;
    data['ref'] = ref;
    data['square_meter'] = squareMeter;
    data['url'] = url;
    return data;
  }
}

class Information {
  AdditionalSurfaces? additionalSurfaces;
  Amenities? amenities;
  BuildingCharacteristics? buildingCharacteristics;
  LeaseRentCharges? leaseRentCharges;
  Pictures? pictures;
  PropertyCharacteristics? propertyCharacteristics;

  Information(
      {additionalSurfaces,
      amenities,
      buildingCharacteristics,
      leaseRentCharges,
      pictures,
      propertyCharacteristics});

  Information.fromJson(Map<String, dynamic> json) {
    additionalSurfaces = json['additional_surfaces'] != null
        ? AdditionalSurfaces.fromJson(json['additional_surfaces'])
        : null;
    amenities = json['amenities'] != null
        ? Amenities.fromJson(json['amenities'])
        : null;
    buildingCharacteristics = json['building_characteristics'] != null
        ? BuildingCharacteristics.fromJson(json['building_characteristics'])
        : null;
    leaseRentCharges = json['lease_rent_charges'] != null
        ? LeaseRentCharges.fromJson(json['lease_rent_charges'])
        : null;
    pictures =
        json['pictures'] != null ? Pictures.fromJson(json['pictures']) : null;
    propertyCharacteristics = json['property_characteristics'] != null
        ? PropertyCharacteristics.fromJson(json['property_characteristics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (additionalSurfaces != null) {
      data['additional_surfaces'] = additionalSurfaces!.toJson();
    }
    if (amenities != null) {
      data['amenities'] = amenities!.toJson();
    }
    if (buildingCharacteristics != null) {
      data['building_characteristics'] = buildingCharacteristics!.toJson();
    }
    if (leaseRentCharges != null) {
      data['lease_rent_charges'] = leaseRentCharges!.toJson();
    }
    if (pictures != null) {
      data['pictures'] = pictures!.toJson();
    }
    if (propertyCharacteristics != null) {
      data['property_characteristics'] = propertyCharacteristics!.toJson();
    }
    return data;
  }
}

class AdditionalSurfaces {
  String? cellar;
  String? privateParking;
  int? flatId;
  int? id;

  AdditionalSurfaces({cellar, privateParking, flatId, id});

  AdditionalSurfaces.fromJson(Map<String, dynamic> json) {
    cellar = json['Cellar'];
    privateParking = json['Private_parking'];
    flatId = json['flat_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Cellar'] = cellar;
    data['Private_parking'] = privateParking;
    data['flat_id'] = flatId;
    data['id'] = id;
    return data;
  }
}

class Amenities {
  String? bathtub;
  String? kitchenSink;
  String? shower;
  String? tVAntenna;
  String? ventilationSystem;
  String? washbasin;
  String? washingMachineConnection;
  int? amenitiesId;
  int? flatId;

  Amenities(
      {bathtub,
      kitchenSink,
      shower,
      tVAntenna,
      ventilationSystem,
      washbasin,
      washingMachineConnection,
      amenitiesId,
      flatId});

  Amenities.fromJson(Map<String, dynamic> json) {
    bathtub = json['Bathtub'];
    kitchenSink = json['Kitchen_sink'];
    shower = json['Shower'];
    tVAntenna = json['TV_antenna'];
    ventilationSystem = json['Ventilation_system'];
    washbasin = json['Washbasin'];
    washingMachineConnection = json['Washing_machine_connection'];
    amenitiesId = json['amenities_id'];
    flatId = json['flat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Bathtub'] = bathtub;
    data['Kitchen_sink'] = kitchenSink;
    data['Shower'] = shower;
    data['TV_antenna'] = tVAntenna;
    data['Ventilation_system'] = ventilationSystem;
    data['Washbasin'] = washbasin;
    data['Washing_machine_connection'] = washingMachineConnection;
    data['amenities_id'] = amenitiesId;
    data['flat_id'] = flatId;
    return data;
  }
}

class BuildingCharacteristics {
  String? cleaningCompany;
  String? digicode;
  String? elevator;
  String? greenPeaces;
  int? numberOfFloor;
  String? tVAntenna;
  int? yearOfConstruction;
  int? buildingCharacId;
  int? flatId;

  BuildingCharacteristics(
      {cleaningCompany,
      digicode,
      elevator,
      greenPeaces,
      numberOfFloor,
      tVAntenna,
      yearOfConstruction,
      buildingCharacId,
      flatId});

  BuildingCharacteristics.fromJson(Map<String, dynamic> json) {
    cleaningCompany = json['Cleaning_company'];
    digicode = json['Digicode'];
    elevator = json['Elevator'];
    greenPeaces = json['Green_peaces'];
    numberOfFloor = json['Number_of_Floor'];
    tVAntenna = json['TV_antenna'];
    yearOfConstruction = json['Year_of_construction'];
    buildingCharacId = json['building_charac_id'];
    flatId = json['flat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Cleaning_company'] = cleaningCompany;
    data['Digicode'] = digicode;
    data['Elevator'] = elevator;
    data['Green_peaces'] = greenPeaces;
    data['Number_of_Floor'] = numberOfFloor;
    data['TV_antenna'] = tVAntenna;
    data['Year_of_construction'] = yearOfConstruction;
    data['building_charac_id'] = buildingCharacId;
    data['flat_id'] = flatId;
    return data;
  }
}

class LeaseRentCharges {
  String? additionalRent;
  String? availability;
  String? chargeProvision;
  String? checkInFees;
  int? flatId;
  String? leaseDuration;
  String? rentCharges;
  int? rentId;
  String? securityDeposit;
  String? tenantFess;
  String? typeOfLease;

  LeaseRentCharges(
      {additionalRent,
      availability,
      chargeProvision,
      checkInFees,
      flatId,
      leaseDuration,
      rentCharges,
      rentId,
      securityDeposit,
      tenantFess,
      typeOfLease});

  LeaseRentCharges.fromJson(Map<String, dynamic> json) {
    additionalRent = json['additional_rent'];
    availability = json['availability'];
    chargeProvision = json['charge_provision'];
    checkInFees = json['check_in_fees'];
    flatId = json['flat_id'];
    leaseDuration = json['lease_duration'];
    rentCharges = json['rent_charges'];
    rentId = json['rent_id'];
    securityDeposit = json['security_deposit'];
    tenantFess = json['tenant_fess'];
    typeOfLease = json['type_of_lease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['additional_rent'] = additionalRent;
    data['availability'] = availability;
    data['charge_provision'] = chargeProvision;
    data['check_in_fees'] = checkInFees;
    data['flat_id'] = flatId;
    data['lease_duration'] = leaseDuration;
    data['rent_charges'] = rentCharges;
    data['rent_id'] = rentId;
    data['security_deposit'] = securityDeposit;
    data['tenant_fess'] = tenantFess;
    data['type_of_lease'] = typeOfLease;
    return data;
  }
}

class Pictures {
  String? uRLPicture;
  int? flatId;
  int? id;

  Pictures({uRLPicture, flatId, id});

  Pictures.fromJson(Map<String, dynamic> json) {
    uRLPicture = json['URL_picture'];
    flatId = json['flat_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['URL_picture'] = uRLPicture;
    data['flat_id'] = flatId;
    data['id'] = id;
    return data;
  }
}

class PropertyCharacteristics {
  String? doubleGlazing;
  String? floor;
  String? heatingSystem;
  String? hotWaterSystem;
  double? livingArea;
  int? numberOfBathrooms;
  int? numberOfBedrooms;
  int? numberOfRooms;
  double? totalArea;
  int? flatId;
  int? properCharacId;

  PropertyCharacteristics(
      {doubleGlazing,
      floor,
      heatingSystem,
      hotWaterSystem,
      livingArea,
      numberOfBathrooms,
      numberOfBedrooms,
      numberOfRooms,
      totalArea,
      flatId,
      properCharacId});

  PropertyCharacteristics.fromJson(Map<String, dynamic> json) {
    doubleGlazing = json['Double_glazing'];
    floor = json['Floor'];
    heatingSystem = json['Heating_system'];
    hotWaterSystem = json['Hot_water_system'];
    livingArea = json['Living_area'];
    numberOfBathrooms = json['Number_of_bathrooms'];
    numberOfBedrooms = json['Number_of_bedrooms'];
    numberOfRooms = json['Number_of_rooms'];
    totalArea = json['Total_area'];
    flatId = json['flat_id'];
    properCharacId = json['proper_charac_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Double_glazing'] = doubleGlazing;
    data['Floor'] = floor;
    data['Heating_system'] = heatingSystem;
    data['Hot_water_system'] = hotWaterSystem;
    data['Living_area'] = livingArea;
    data['Number_of_bathrooms'] = numberOfBathrooms;
    data['Number_of_bedrooms'] = numberOfBedrooms;
    data['Number_of_rooms'] = numberOfRooms;
    data['Total_area'] = totalArea;
    data['flat_id'] = flatId;
    data['proper_charac_id'] = properCharacId;
    return data;
  }
}
