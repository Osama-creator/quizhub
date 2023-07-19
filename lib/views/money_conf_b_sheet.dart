import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizhub/app/modules/admin_get_money_req/controllers/admin_get_money_req_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/helper/alert.dart';

Future<dynamic> confirmMoneyOrder(
  BuildContext context,
  AdminGetMoneyReqController controller,
) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<AdminGetMoneyReqController>(
        init: controller,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      color: const Color(0x1AD1EC43),
                      width: context.width,
                      height: context.height * 0.25,
                      child: InkWell(
                        onTap: controller.pickFile,
                        child: controller.image == null
                            ? const Icon(
                                Icons.camera_alt_outlined,
                                size: 40,
                                color: AppColors.black,
                              )
                            : Image.file(
                                controller.image!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    if (controller.image != null)
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () {},
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.send),
                title: const Text('submit'),
                onTap: () {
                  Navigator.of(context).pop();
                  Alert.success("تم الارسال بنجاح");
                },
              ),
            ],
          );
        },
      );
    },
  );
}
