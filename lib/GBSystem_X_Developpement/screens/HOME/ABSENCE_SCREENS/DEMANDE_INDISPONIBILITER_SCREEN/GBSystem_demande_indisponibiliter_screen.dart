import 'package:animated_toggle/animated_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/helper/GBSystem_waiting.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/screens/HOME/ABSENCE_SCREENS/DEMANDE_ABSENCE_SCREEN/GBSystem_demande_absence_screen_controller.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/widgets/HOME_WIDGET/ABSENCE_WIDGETS/FORMULAIRE_DEMANDE_INDISPONIBILITER/formulaire_demande_indisponibiliter_widget.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/widgets/HOME_WIDGET/ABSENCE_WIDGETS/INDISPONIBILITER_DISPLAY_DATA_WIDGET/indisponibiliter_display_data_widget.dart';
import 'package:portail_salarie/_RessourceStrings/GBSystem_Application_Strings.dart';

class GBSystemDemandeIndisponibiliterScreen extends StatelessWidget {
  GBSystemDemandeIndisponibiliterScreen(
      {super.key, this.isCommingFromOut = false});
  final m = Get.put<GBSystemDemandeAbsenceScreenController>(
      GBSystemDemandeAbsenceScreenController());
  final bool isCommingFromOut;
  updateLoading(bool myBool) {
    m.isLoading.value = myBool;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
                extendBodyBehindAppBar: false,
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 4.0,
                  shadowColor: GbsSystemStrings.str_primary_color,
                  toolbarHeight: 80,
                  backgroundColor: GbsSystemStrings.str_primary_color,
                  title: Text(
                    GbsSystemStrings.str_demande_indisponibiliter.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: isCommingFromOut
                      ? InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                ),
                body: Column(
                  children: [
                    AnimatedHorizontalToggle(
                      taps: [
                        GbsSystemStrings.str_demande_indisponibiliter.tr,
                        GbsSystemStrings.str_list_des_indisponibiliter.tr
                      ],
                      width: MediaQuery.of(context).size.width - 20,
                      height: 45,
                      duration: const Duration(milliseconds: 200),
                      initialIndex: m.currentPageIndex.value,
                      background: Colors.grey.shade200.withOpacity(0.6),
                      activeColor: GbsSystemStrings.str_primary_color,
                      activeTextStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      inActiveTextStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: GbsSystemStrings.str_primary_color),
                      horizontalPadding: 4,
                      verticalPadding: 4,
                      activeHorizontalPadding: 2,
                      activeVerticalPadding: 4,
                      radius: 14,
                      activeButtonRadius: 14,
                      onChange: (int currentIndex, int targetIndex) {
                        m.pageController.animateToPage(targetIndex,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      showActiveButtonColor: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: m.pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                FormulaireDemandeIndisponibiliterWidget(
                                  updateLoading: updateLoading,
                                ),
                              ],
                            ),
                          ),
                          GBSystemListIndisponibiliterWidget(
                            updateLoading: updateLoading,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            m.isLoading.value ? Waiting() : Container()
          ],
        ));
  }
}
