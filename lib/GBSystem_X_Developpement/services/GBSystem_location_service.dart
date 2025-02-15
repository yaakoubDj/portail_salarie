import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/models/SERVER_MODELS/FIND_PLACES_API_MODELS/GBSystem_place_model.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/services/api.dart';

class LocationService {
  Future<Position?> determinePosition() async {
    // bool serviceEnabled;
    LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return null;
    // }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            timeLimit: Duration(seconds: 10));
        return position;
      } catch (e) {
        // throw Exception(
        //     "Time out for Localisation Check your network and try again");
        // return null; // Handle the exception here or log it.
        return null;
      }
    }

    return null;
  }

  Future<List<GbsystemPlaceModel>> getSuggestionsPosition(BuildContext context,
      {required String search}) async {
    List<GbsystemPlaceModel> listPlaces = [];
    await Api(context)
        .get(
            url:
                "https://api-adresse.data.gouv.fr/search/?q=$search&autocomplete=1",
            token: null)
        .then(
      (responseServer) {
        if (responseServer.isDataPlacesApiIsNotEmpty()) {
          listPlaces = GbsystemPlaceModel.convertDynamictoList(
              (responseServer.data["features"] as List));
        }

        return listPlaces;
      },
    );
    return listPlaces;
  }
}
