import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/languages/controllers/languages_controller.dart';
import 'package:quizhub/generated/tr.dart';

class LanguagesView extends GetView<LanguagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Tr.language.tr,
        ),
      ),
      body: Column(
        children: Lang.supportedLocales
            .map((locale) => buildListTile(locale: locale, context: context))
            .toList(),
      ),
    );
  }

  Widget buildListTile({
    required Locale locale,
    required BuildContext context,
  }) {
    return ListTile(
      title: Text(
        locale.toString().tr,
        style: context.bodyText1,
      ),
      leading: Checkbox(
        activeColor: context.primaryColor,
        value: Lang.current == locale,
        onChanged: (value) {
          Lang.update(locale);
        },
      ),
    );
  }
}
