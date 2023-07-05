/* Create function to retrieve Dagta from API */
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Map<String, dynamic>> fetchData(int id) async {
  /* Function to fetch data from the server based on an ID */
  final url = Uri.parse(
      'http://152.228.216.105:5000/appartment/$id'); /* Define the URL for the request */
  var response =
      await http.get(url); /* Send a GET request to the specified URL */
  if (response.statusCode == 200) {
    /* Check the response status code */
    var jsonResponse = json.decode(response.body); /* Parse the JSON response */
    var data = {
      /* Extract the required data from the JSON response and store it in a map */
      "appartment": {
        "address": jsonResponse["apppartment"]["address"],
        "agency": jsonResponse["apppartment"]["agency"],
        "createdAt": jsonResponse["apppartment"]["created_at"],
        "description": jsonResponse["apppartment"]["description"],
        "name": jsonResponse["apppartment"]["name"],
        "phonenumber": jsonResponse["apppartment"]["phonenumber"],
        "postalCode": jsonResponse["apppartment"]["postal_code"],
        "price": jsonResponse["apppartment"]["price"],
        "ref": jsonResponse["apppartment"]["ref"],
        "squareMeter": jsonResponse["apppartment"]["square_meter"],
        "url": jsonResponse["apppartment"]["url"]
      },
      "informations": {
        "additional_surfaces": {
          "Cellar": jsonResponse["information"]["additional_surfaces"]
              ["Cellar"],
          "Private_parking": jsonResponse["information"]["additional_surfaces"]
              ["Private_parking"],
          "flat_id": jsonResponse["information"]["additional_surfaces"]
              ["flat_id"],
          "id": jsonResponse["information"]["additional_surfaces"]["id"]
        },
        "amenities": {
          "Bathtub": jsonResponse["information"]["amenities"]["Bathtub"],
          "Kitchen_sink": jsonResponse["information"]["amenities"]
              ["Kitchen_sink"],
          "Shower": jsonResponse["information"]["amenities"]["Shower"],
          "TV_antenna": jsonResponse["information"]["amenities"]["TV_antenna"],
          "Ventilation_system": jsonResponse["information"]["amenities"]
              ["Ventilation_system"],
          "Washbasin": jsonResponse["information"]["amenities"]["Washbasin"],
          "Washing_machine_connection": jsonResponse["information"]["amenities"]
              ["Washing_machine_connection"],
          "amenities_id": jsonResponse["information"]["amenities"]
              ["amenities_id"],
          "flat_id": jsonResponse["information"]["amenities"]["flat_id"]
        },
        "building_characteristics": {
          "Cleaning_company": jsonResponse["information"]
              ["building_characteristics"]["Cleaning_company"],
          "Digicode": jsonResponse["information"]["building_characteristics"]
              ["Digicode"],
          "Elevator": jsonResponse["information"]["building_characteristics"]
              ["Elevator"],
          "Green_peaces": jsonResponse["information"]
              ["building_characteristics"]["Green_peaces"],
          "Number_of_Floor": jsonResponse["information"]
              ["building_characteristics"]["Number_of_Floor"],
          "TV_antenna": jsonResponse["information"]["building_characteristics"]
              ["TV_antenna"],
          "Year_of_construction": jsonResponse["information"]
              ["building_characteristics"]["Year_of_construction"],
          "building_charac_id": jsonResponse["information"]
              ["building_characteristics"]["building_charac_id"],
          "flat_id": jsonResponse["information"]["building_characteristics"]
              ["flat_id"]
        },
        "lease_rent_charges": {
          "additional_rent": jsonResponse["information"]["lease_rent_charges"]
              ["additional_rent"],
          "availability": jsonResponse["information"]["lease_rent_charges"]
              ["availability"],
          "charge_provision": jsonResponse["information"]["lease_rent_charges"]
              ["charge_provision"],
          "check_in_fees": jsonResponse["information"]["lease_rent_charges"]
              ["check_in_fees"],
          "flat_id": jsonResponse["information"]["lease_rent_charges"]
              ["flat_id"],
          "lease_duration": jsonResponse["information"]["lease_rent_charges"]
              ["lease_duration"],
          "rent_charges": jsonResponse["information"]["lease_rent_charges"]
              ["rent_charges"],
          "rent_id": jsonResponse["information"]["lease_rent_charges"]
              ["rent_id"],
          "security_deposit": jsonResponse["information"]["lease_rent_charges"]
              ["security_deposit"],
          "tenant_fess": jsonResponse["information"]["lease_rent_charges"]
              ["tenant_fess"],
          "type_of_lease": jsonResponse["information"]["lease_rent_charges"]
              ["type_of_lease"]
        },
        "pictures": {
          "URL_picture": jsonResponse["information"]["pictures"]["URL_picture"],
          "flat_id": jsonResponse["information"]["pictures"]["flat_id"],
          "id": jsonResponse["information"]["pictures"]["id"]
        },
        "property_characteristics": {
          "Double_glazing": jsonResponse["information"]
              ["property_characteristics"]["Double_glazing"],
          "Floor": jsonResponse["information"]["property_characteristics"]
              ["Floor"],
          "Heating_system": jsonResponse["information"]
              ["property_characteristics"]["Heating_system"],
          "Hot_water_system": jsonResponse["information"]
              ["property_characteristics"]["Hot_water_system"],
          "Living_area": jsonResponse["information"]["property_characteristics"]
              ["Living_area"],
          "Number_of_bathrooms": jsonResponse["information"]
              ["property_characteristics"]["Number_of_bathrooms"],
          "Number_of_bedrooms": jsonResponse["information"]
              ["property_characteristics"]["Number_of_bedrooms"],
          "Number_of_rooms": jsonResponse["information"]
              ["property_characteristics"]["Number_of_rooms"],
          "Total_area": jsonResponse["information"]["property_characteristics"]
              ["Total_area"],
          "flat_id": jsonResponse["information"]["property_characteristics"]
              ["flat_id"],
          "proper_charac_id": jsonResponse["information"]
              ["property_characteristics"]["proper_charac_id"]
        }
      }
    };
    return data;
  } else {
    var error = 'Erreur: ${response.statusCode}';
    return {"error": error};
  }
}
