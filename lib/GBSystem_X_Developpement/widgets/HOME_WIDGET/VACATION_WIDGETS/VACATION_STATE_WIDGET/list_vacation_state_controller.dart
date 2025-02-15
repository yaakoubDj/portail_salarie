import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/controllers/GBSystem_vacation_state_demander_controller.dart';
import 'package:portail_salarie/_RessourceStrings/GBSystem_Application_Strings.dart';

class ListVacationStateWidgetController extends GetxController {

ListVacationStateWidgetController(this.context);
  BuildContext context;
  Rx<Color?> typeAbsColor =Rx<Color?>(GbsSystemStrings.str_primary_color) ;
  
  final vacationStateController = Get.put<GBSystemVacationStateDemanderController>(
      GBSystemVacationStateDemanderController());

PageController pageController = PageController(initialPage: 0);
RxInt currentPageIndex = 0.obs;
  

@override
  void onClose() {
  pageController.dispose();
   super.onClose();
  }

@override
  void onInit() {
     
   super.onInit();
  }


}