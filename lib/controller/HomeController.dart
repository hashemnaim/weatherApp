
import 'package:geocoding/geocoding.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '/model/current_weather_data.dart';
import '/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  String? errorMassege;

  HomeController({required this.city});
bool isLoad=false;
  @override
  void onInit() async{
    //  Position newLocalData = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    //  city =
    //     await getUserCity(newLocalData.latitude, newLocalData.longitude);
    initState();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState()  {
   
    getCurrentWeatherData();
  }

  void getCurrentWeatherData()  {
    isLoad=true;
    WeatherService(city: city??"gaza").getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          isLoad=false;
          update();
        },
        onError: (error)  {
                        isLoad=false;
errorMassege=error.toString();
              update();
            });
  }

  Future<String> getUserCity(lat, lng) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lng);
    Placemark placeMark = newPlace[0];
    String locality = placeMark.locality ?? "";
    String city = locality;
    return city;
  }
}
