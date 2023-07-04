
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// class LocationPermissionScreen extends StatelessWidget {
//   const LocationPermissionScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,

//       body: SafeArea(
//         child: Container(
//           width: Get.width,
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.location_off_outlined,
//                   color: Colors.black,
//                   size: 40,
//                 ),
//                 onPressed: () {},
//               ),
//               const SizedBox(height: 16,),
//               Text(
//                 "LOCATION_PERMISSIONS_ARE_DENIED".tr,
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Colors.blue,
//                     ),
//               ),
//               Text(
//                 "LOCATION_PERMISSIONS_ARE_PERMANENTLY_DENIED_WE_CANNOT_REQUEST_PERMISSIONS"
//                     .tr,
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//            color: Colors.blue,
//                     ),
//               ),
//               const SizedBox(height: 16,),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTextButton(
//                       text: "REFRESH".tr,
//                       color: Colors.white,
//                       isOutlined: true,
//                       onPress: () async {
//                         LocationPermission permission =
//                             await Geolocator.checkPermission();

//                         if (permission == LocationPermission.always ||
//                             permission == LocationPermission.whileInUse) {
//                           Get.deleteAll();
//                           Get.offAndToNamed('/');
//                         } else {
//                           showToast(
//                             "ERROR".tr,
//                             "${'LOCATION_PERMISSIONS_ARE_DENIED'.tr}! ${"OPEN_SETTING".tr}",
//                             ToastType.WARNING,
//                           );
//                         }
//                       },
//                     ),
//                   ),
//               const SizedBox(width: 16,),
//                   Expanded(
//                     child: CustomTextButton(
//                       text: "OPEN_SETTING".tr,
//                       color: AppColors.white,
//                       isOutlined: true,
//                       onPress: () async {
//                         await Geolocator.openAppSettings();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
