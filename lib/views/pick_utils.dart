import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/city.dart';
import 'package:quizhub/app/services/common.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/input_feild.dart';

class PickClss extends StatefulWidget {
  const PickClss({super.key});

  @override
  State<PickClss> createState() => _PickClssState();
}

class _PickClssState extends State<PickClss> {
  final items = <String>[
    "الاول الابتدائي",
    "الثاني الابتدائي",
    "الثالث الابتدائي",
    "الرابع الابتدائي",
    "الخامس الابتدائي",
    "السادس الابتدائي",
    "الاول الاعدادي",
    "الثاني الاعدادي",
    "الثالث الاعدادي",
    "الاول الثانوي",
    "الثاني الثانوي",
    "الثالث الثانوي"
  ];
  final inputController = TextEditingController();
  final itemsToDisplay = <String>[
    "الاول الابتدائي",
    "الثاني الابتدائي",
    "الثالث الابتدائي",
    "الرابع الابتدائي",
    "الخامس الابتدائي",
    "السادس الابتدائي",
    "الاول الاعدادي",
    "الثاني الاعدادي",
    "الثالث الاعدادي",
    "الاول الثانوي",
    "الثاني الثانوي",
    "الثالث الثانوي"
  ];
  bool isLoading = false;

  void onTextChanges(String input) {
    setState(() {
      itemsToDisplay.clear();
      itemsToDisplay.addAll(
        items.where((e) => e.contains(input.trim())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: isLoading
          ? const CenterLoading()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InputField(
                          hint: 'بحث',
                          onChanged: onTextChanges,
                          controller: inputController,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: itemsToDisplay.isEmpty
                      ? const Center(
                          child: Text(
                            'لا يوجد نتائج بحث',
                          ),
                        )
                      : ListView(
                          children: itemsToDisplay
                              .map(
                                (e) => Card(
                                  child: ListTile(
                                    onTap: () => Get.back(result: e),
                                    title: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                )
              ],
            ),
    );
  }
}

class PickCity extends StatefulWidget {
  const PickCity({super.key});

  @override
  State<PickCity> createState() => _PickCityState();
}

class _PickCityState extends State<PickCity> {
  final items = <CityModel>[];
  final inputController = TextEditingController();
  final itemsToDisplay = <CityModel>[];
  final itemsId = <String>[];
  bool isLoading = false;

  @override
  void initState() {
    getCities();
    super.initState();
  }

  Future<void> getCities() async {
    try {
      isLoading = true;
      items.clear();
      final List<CityModel> cities =
          await Get.find<CommonService>().getCitiesList();
      items.addAll(cities);
      itemsToDisplay.addAll(items);
      setState(() {});
    } catch (e, st) {
      Alert.error(e);
      catchLog(e, st);
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  void onTextChanges(String input) {
    setState(() {
      itemsToDisplay.clear();
      itemsToDisplay.addAll(
        items.where((e) => e.arName.contains(input.trim())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: isLoading
          ? const CenterLoading()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InputField(
                          hint: 'بحث',
                          onChanged: onTextChanges,
                          controller: inputController,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: itemsToDisplay.isEmpty
                      ? const Center(
                          child: Text(
                            'لا يوجد نتائج بحث',
                          ),
                        )
                      : ListView(
                          children: itemsToDisplay
                              .map(
                                (e) => Card(
                                  child: ListTile(
                                    onTap: () => Get.back(
                                      result: e,
                                    ),
                                    title: Text(e.arName),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                )
              ],
            ),
    );
  }
}

class PickSchool extends StatefulWidget {
  final String cityId;
  const PickSchool({super.key, required this.cityId});

  @override
  State<PickSchool> createState() => _PickSchoolState();
}

class _PickSchoolState extends State<PickSchool> {
  final items = <String>[];
  final inputController = TextEditingController();
  final itemsToDisplay = <String>[];
  bool isLoading = false;

  @override
  void initState() {
    getSchools();
    super.initState();
  }

  Future<void> getSchools() async {
    try {
      isLoading = true;
      items.clear();
      final List<String> schools =
          await Get.find<CommonService>().getSchoolList(cityId: widget.cityId);
      items.addAll(schools);
      itemsToDisplay.addAll(items);
      setState(() {});
    } catch (e, st) {
      Alert.error(e);
      catchLog(e, st);
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  void onTextChanges(String input) {
    setState(() {
      itemsToDisplay.clear();
      itemsToDisplay.addAll(
        items.where((e) => e.contains(input.trim())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: isLoading
          ? const CenterLoading()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InputField(
                          hint: 'بحث',
                          onChanged: onTextChanges,
                          controller: inputController,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: itemsToDisplay.isEmpty
                      ? const Center(
                          child: Text(
                            'لا يوجد نتائج بحث',
                          ),
                        )
                      : ListView(
                          children: itemsToDisplay
                              .map(
                                (e) => Card(
                                  child: ListTile(
                                    onTap: () => Get.back(result: e),
                                    title: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                )
              ],
            ),
    );
  }
}
