import 'package:flutter/material.dart';

import '../controller/HomeController.dart';

class SearchCard extends StatelessWidget {
 final HomeController controller;
  const SearchCard({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 100, left: 20, right: 20),
      child: TextField(
        onChanged: (value) => controller.city = value,
        style: const TextStyle(
          color: Colors.white,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) =>
            controller.updateWeather(),
        decoration: InputDecoration(
          suffix: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Colors.white,fontSize: 13),
          hintText: 'Search'.toUpperCase(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
