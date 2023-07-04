import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:unit_one/helper/animate_do.dart';

import '../../controller/HomeController.dart';
import '../../widget/searchCard.dart';
import '../../widget/weatherCard.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return controller.isLoad == true
            ? Column(
                children: [
                  Image.asset(
                    'assets/images/cloud-in-blue-sky.jpg',
                  ),
                  Text(
                    controller.errorMassege ?? "",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black38, BlendMode.darken),
                          image: AssetImage(
                            'assets/images/cloud-in-blue-sky.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[

                          //Enter the weather box by city
                          SearchCard(controller: controller),

                          //It is displaying weather data
                          ZoomIn(child: CardWeather(controller: controller)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeInLeft(
                          duration:Duration(milliseconds: 500*index) ,
                          child: Card(
                              elevation: 1,
                              child: ListTile(
                                title: Text(
                                  DateFormat().add_MMMMEEEEd().format(
                                      DateTime.now()
                                          .add(Duration(days: index + 1))),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontFamily: 'flutterfonts'),
                                ),
                                subtitle: Text(
                                  '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.black45,
                                        fontSize: 12,
                                        fontFamily: 'flutterfonts',
                                      ),
                                ),
                                trailing: Text(
                                  'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                                ),
                              )),
                        );
                      },
                    ),
                  )
                ],
              );
      }),
    );
  }
}
