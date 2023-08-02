import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander_app/models/user_model/user_model.dart';
import 'package:santander_app/services/api.dart';
import 'package:santander_app/shared/app_colors.dart';
import 'package:santander_app/shared/app_images.dart';
import 'package:santander_app/widgets/balance.dart';
import 'package:santander_app/widgets/features.dart';
import 'package:santander_app/widgets/info_card.dart';

import '../../widgets/card.dart';
import '../../widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
  var fetchedUser = await ApiApp.fetchUser(1);
  setState(() {
    user = fetchedUser;
  });
}


  @override
  Widget build(BuildContext context) {
    return user == null 
    ? const Scaffold(
      body: Center(child: CircularProgressIndicator()),
      ) 
      : Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(
            AppImages.logo,
            height: 24,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              AppImages.notification,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [ 
          HeaderWidget(
            user: user!,
        ) ,
        const SizedBox(
              height: 10,
             ),
             BalanceWidget(account: user!.account!),
             
             FeaturesWidget(features: user!.features!) ,
             const SizedBox(
              height: 10,
             ),
             CardWidget( card: user!.card!), 
             const SizedBox(
              height: 10,
             ),
             InfoCardsWidget(news: user!.news!),
        ],
      ),
    );
  }
}

