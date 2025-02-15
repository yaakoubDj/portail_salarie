import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:blobs/blobs.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/helper/GBSystem_ScreenHelper.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/helper/GBSystem_text_helper.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/helper/GBSystem_toast.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/screens/ERROR/ERROR_SERVER/GBSystem_error_server_controller.dart';
import 'package:portail_salarie/_RessourceStrings/GBSystem_Application_Strings.dart';
import 'package:portail_salarie/_RessourceStrings/GBSystem_Server_Strings.dart';

class ErrorServerPage extends StatelessWidget {
  ErrorServerPage({super.key, required this.destination});

  final Widget destination;
  final m = Get.put<ErrorServerController>(ErrorServerController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: GbsSystemStrings.str_primary_color,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: GBSystem_ScreenHelper.screenHeightPercentage(
                        context, 0.02)),
                child: SizedBox(
                    width: GBSystem_ScreenHelper.screenWidthPercentage(
                        context, 0.8),
                    child: GBSystem_TextHelper().largeText(
                      text: GbsSystemStrings.str_error_server_title.tr,
                      textColor: Colors.white,
                      maxLines: 3,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    )),
              ),
              Center(
                child: Lottie.asset(
                    GbsSystemServerStrings.str_error_server_lottie_path,
                    width: GBSystem_ScreenHelper.screenWidthPercentage(
                        context, 0.8),
                    height: GBSystem_ScreenHelper.screenHeightPercentage(
                        context, 0.5),
                    fit: BoxFit.fill),
              ),
              InkWell(
                onTap: () async {
                  // Get.off(destination);
                  if (m.numberTap.value < 3) {
                    showToast(
                        text:
                            "${GbsSystemStrings.str_appyier.tr} ${3 - m.numberTap.value} ${GbsSystemStrings.str_fois_pour_quiter.tr}");

                    m.numberTap.value++;
                  } else {
                    exit(0);
                  }
                },
                child: Blob.animatedRandom(
                  styles: BlobStyles(color: Colors.amber),
                  size: 200,
                  edgesCount: 5,
                  minGrowth: 4,
                  loop: true,
                  duration: const Duration(seconds: 3),
                  child: Center(
                      child: GBSystem_TextHelper().normalText(
                    text: GbsSystemStrings.str_quitter.tr,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
