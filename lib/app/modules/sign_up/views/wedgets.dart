import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/config/theme.dart';

Widget buildRoleButton(
    UserRole role, String label, SignUpController controller) {
  final isSelected = controller.roleName == role;
  return ElevatedButton(
    onPressed: () {
      controller.roleName = role;
      controller.update();
    },
    style: ButtonStyle(
      backgroundColor: isSelected
          ? MaterialStateProperty.all(AppColors.primary)
          : MaterialStateProperty.all(Colors.white),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: isSelected ? Colors.white : AppColors.primary,
      ),
    ),
  );
}

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: context.width * 0.5,
          height: context.height * 0.2,
          child: ClipOval(
            child: InkWell(
              onTap: controller.pickImage,
              child: controller.image == null
                  ? const Icon(
                      Icons.camera_alt_outlined,
                      size: 100,
                      color: AppColors.primary,
                    )
                  : Image.file(
                      controller.image!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
        if (controller.image != null)
          Positioned(
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () {
                controller.image = null;
                controller.update();
              },
            ),
          ),
      ],
    );
  }
}
