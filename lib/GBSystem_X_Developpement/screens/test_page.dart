import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/models/SERVER_MODELS/GBSystem_app_info_details_model.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/services/firebase_serivce.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/services/package_info_service.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/services/pick_file_service.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/services/topic_manager.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/services/url_launcher_service.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/widgets/GENERAL_WIDGETS/custom_button.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: 100,
        child: CustomButton(
          text: "text",
          onTap: () async {
            // await FirebaseSerivce(context).getToken();
            await TopicManager().subscribeToTopic("CLI24");
            await TopicManager().getSubscribedTopics();
            // GbsystemAppInfoDetailsModel? a =
            //     GbsystemAppInfoDetailsModel.parseStringToData(
            //         dataString:
            //             "version=1.0.0;app_store_link=dsdsdssd;play_store_link=fdfdfdfdf;update_required=fdfdfdf");

            // String d = await PackageInfoService().getAppVersion();
            // print("current ${d}");
            // UrlLauncherService().openWebsite(context,
            //     webSite:
            //         "https://play.google.com/store/apps/details?id=com.bmsoft.portailsalarie");
            // UrlLauncherService().openWebsite(context,
            //     webSite: "https://apps.apple.com/fr/app/portailsalarie/123456");
          },
        ),
      ),
    ));
  }
}
