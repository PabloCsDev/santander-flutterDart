import 'package:flutter/material.dart';
import 'package:santander_app/models/user_model/user_model.dart';

import '../shared/app_colors.dart';
import '../shared/app_settings.dart';

class HeaderWidget extends StatelessWidget {
  final UserModel user;
  const HeaderWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      height: AppSettings.screenHeight / 5,
      width: AppSettings.screenWidth ,
      color: AppColors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Olá, ${user.name}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            "Ag ${user.account!.agency} Cc ${user.account!.number}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
