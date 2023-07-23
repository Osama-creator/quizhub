import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_mcq_quistion_controller.dart';

class EditMcqQuistionView extends GetView<EditMcqQuistionController> {
  const EditMcqQuistionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditMcqQuistionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditMcqQuistionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
