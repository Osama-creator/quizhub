import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
