import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/services/common.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/input_feild.dart';

class PickClss extends StatefulWidget {
  final VoidCallback onPressed;
  const PickClss({super.key, required this.onPressed});

  @override
  State<PickClss> createState() => _PickClssState();
}

class _PickClssState extends State<PickClss> {
  final items = <String>[];
  final inputController = TextEditingController();
  final itemsToDisplay = <String>[];

  bool isLoading = false;

  @override
  void initState() {
    getGrades();
    super.initState();
  }

  Future<void> getGrades() async {
    try {
      isLoading = true;
      items.clear();
      final List<String> grades =
          await Get.find<CommonService>().getGradesList();
      items.addAll(grades);
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
                Row(
                  children: [
                    IconButton(
                      onPressed: widget.onPressed,
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text("اضافه صف جديد")
                  ],
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
                                    onTap: () {
                                      Get.back(result: e);
                                      itemsToDisplay.remove(e);
                                      items.remove(e);
                                    },
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

class PickSub extends StatefulWidget {
  const PickSub({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<PickSub> createState() => _PickSubState();
}

class _PickSubState extends State<PickSub> {
  final items = <String>[];
  final inputController = TextEditingController();
  final itemsToDisplay = <String>[];

  bool isLoading = false;

  @override
  void initState() {
    getSubjects();
    super.initState();
  }

  Future<void> getSubjects() async {
    try {
      isLoading = true;
      items.clear();
      final List<String> subjects =
          await Get.find<CommonService>().getSubjectsList();
      items.addAll(subjects);
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
                Row(
                  children: [
                    IconButton(
                      onPressed: widget.onPressed,
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text("اضافه ماده")
                  ],
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
  final items = <String>[];
  final inputController = TextEditingController();
  final itemsToDisplay = <String>[];

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
      final List<String> cities =
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
                                    onTap: () => Get.back(
                                      result: e,
                                    ),
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

class PickSchool extends StatefulWidget {
  final String city;
  final VoidCallback onPressed;
  const PickSchool({super.key, required this.city, required this.onPressed});

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
          await Get.find<CommonService>().getSchoolList(city: widget.city);
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
                Row(
                  children: [
                    IconButton(
                      onPressed: widget.onPressed,
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text("اضافه مدرسه")
                  ],
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
