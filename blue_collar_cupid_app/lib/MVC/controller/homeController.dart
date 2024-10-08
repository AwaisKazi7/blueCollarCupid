import 'package:get/get.dart';

class homeController extends GetxController {
  var Placesloading = false.obs;
  
//-----Driver form one
  RxString drivercity = ''.obs;
  RxString driverstate = ''.obs;
  RxString driverDOB = ''.obs;
  RxString driverpetAvalibilty = ''.obs;
  //-----Driver vehicle two
  RxString driverVehicleModelyear = ''.obs;
  RxString driverVehicleModelname = ''.obs;
  RxString driverVehicleModelnumber = ''.obs;
  RxString driverVehicleColor = ''.obs;
  RxString drivervehicleExpiryDate = ''.obs;
  RxString drivervehicleRegistrationNumber = ''.obs;
  //------
  RxString licenseFrontPciture = ''.obs;
  RxString DrivinglicenseImagebackpicture = ''.obs;
  RxString DrivingcertificateImage = ''.obs;
  RxString DrivingtrainingcertificateImage = ''.obs;


  // for chat messages
  RxString chatRoomId = ''.obs;
  RxString rideId = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // searchPlaceApi(BuildContext context, String placesName) async {
  //   try {
  //     Placesloading.value = true;
  //     final listData =
  //         // await AppService.getInstance.searchPlaceApi(context, placesName);

  //     placesList.value = listData;

  //     print('placesList: ${placesList.length}');
  //     Placesloading.value = false;
  //   } catch (e) {
  //     Placesloading.value = false;
  //     print('error searchPlaceApi view model:$e');
  //   }
  // }

  // getvehilcePrics(BuildContext context) async {
  //   try {
  //     // final listData = await AppService.getInstance.getvehilcePrics(context);

  //     VehiclePriceList.value = listData;

  //     print('VehiclePriceList: ${VehiclePriceList.length}');
  //   } catch (e) {
  //     print('error getvehilcePrics view model:$e');
  //   }
  // }


  
}
