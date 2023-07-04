import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';
import '../controller/HomeController.dart';

class CardWeather extends StatelessWidget {
 final HomeController controller;
  const CardWeather({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.4),
      child: SizedBox(
        height: 10,
        width: 10,
        child: OverflowBox(
          minWidth: 0.0,
          maxWidth: MediaQuery.of(context).size.width,
          minHeight: 0.0,
          maxHeight:
              (MediaQuery.of(context).size.height / 4),
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15),
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            top: 15, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                '${controller.currentWeatherData.name}'
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color:
                                          Colors.black45,
                                      fontSize: 24,
                                      fontWeight:
                                          FontWeight.bold,
                                      fontFamily:
                                          'flutterfonts',
                                    ),
                              ),
                            ),
                            Center(
                              child: Text(
                                DateFormat()
                                    .add_MMMMEEEEd()
                                    .format(
                                        DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color:
                                          Colors.black45,
                                      fontSize: 16,
                                      fontFamily:
                                          'flutterfonts',
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(
                                    left: 50),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '${controller.currentWeatherData.weather![0].description}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors
                                            .black45,
                                        fontSize: 22,
                                        fontFamily:
                                            'flutterfonts',
                                      ),
                                ),
                                const SizedBox(
                                    height: 10),
                                Text(
                                  '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: Colors
                                              .black45,
                                          fontFamily:
                                              'flutterfonts'),
                                ),
                                Text(
                                  'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors
                                            .black45,
                                        fontSize: 14,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        fontFamily:
                                            'flutterfonts',
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(
                                    right: 20),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                              children: <Widget>[
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: LottieBuilder
                                      .asset(Images
                                          .cloudyAnim),
                                ),
                                Text(
                                  'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors
                                            .black45,
                                        fontSize: 14,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        fontFamily:
                                            'flutterfonts',
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
