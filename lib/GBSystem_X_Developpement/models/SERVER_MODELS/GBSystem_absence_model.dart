import 'package:intl/intl.dart';

class AbsenceModel {
  final String? CLR_CODE;
  final String? SVR_CODE;
  final String? SVR_LIB;
  final String? TPH_CODE;
  final String? TPH_LIB;
  final String? SVR_NOM;
  final String? SVR_PRNOM;
  final String? PLATPHD_UIDF;
  final String? PLATPHD_IDF;
  final String? PPLATPHD_IDF;
  final String? TPH_IDF;
  final String? SVR_IDF;
  final DateTime? PLATPH_START_HOUR;
  final DateTime? PLATPH_END_HOUR;
  final String? PLATPH_MMO;
  final String? PLATPH_MMO2;
  final String? PLATPH_ETAT;
  final DateTime? PLATPH_DEMAND_DATE;
  final DateTime? PLATPH_ETAT_DATE;
  final String? MAIL_IDF;
  final String? SMS_IDF;
  final String? PLATPH_VAC_IDF;
  final DateTime? LAST_UPDT;
  final String? USER_IDF;
  final String? USR_CODE;
  final String? CLR_CODE_colorweb;

  const AbsenceModel({
    required this.CLR_CODE,
    required this.SVR_CODE,
    required this.SVR_LIB,
    required this.TPH_CODE,
    required this.TPH_LIB,
    required this.SVR_NOM,
    required this.SVR_PRNOM,
    required this.PLATPHD_UIDF,
    required this.PLATPHD_IDF,
    required this.PPLATPHD_IDF,
    required this.TPH_IDF,
    required this.SVR_IDF,
    required this.PLATPH_START_HOUR,
    required this.PLATPH_END_HOUR,
    required this.PLATPH_MMO,
    required this.PLATPH_MMO2,
    required this.PLATPH_ETAT,
    required this.PLATPH_DEMAND_DATE,
    required this.PLATPH_ETAT_DATE,
    required this.MAIL_IDF,
    required this.SMS_IDF,
    required this.PLATPH_VAC_IDF,
    required this.LAST_UPDT,
    required this.USER_IDF,
    required this.USR_CODE,
    required this.CLR_CODE_colorweb,
  });

static String Add_zero(int? value) {
    if (value! < 10) {
      return "0$value";
    } else {
      return "$value";
    }
  }
static String convertTime(DateTime dateTime) {
    return "${Add_zero(dateTime.hour)}:${Add_zero(dateTime.minute)}";
  }

static String convertDate(DateTime dateTime) {
    return "${Add_zero(dateTime.day)}/${Add_zero(dateTime.month)}/${Add_zero(dateTime.year)}";
  }

static String convertDateAndTime(DateTime dateTime) {
    return "${Add_zero(dateTime.day)}/${Add_zero(dateTime.month)}/${Add_zero(dateTime.year)} ${Add_zero(dateTime.hour)}:${Add_zero(dateTime.minute)}";
  }

  static AbsenceModel fromJson(Map<String, dynamic> json) {
    DateFormat dateTimeFormat = DateFormat('dd/MM/yyyy');
    // DateFormat dateTimeFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

    return AbsenceModel(
      CLR_CODE: json['CLR_CODE'],
      SVR_CODE: json['SVR_CODE'],
      SVR_LIB: json['SVR_LIB'],
      TPH_CODE: json['TPH_CODE'],
      TPH_LIB: json['TPH_LIB'],
      SVR_NOM: json['SVR_NOM'],
      SVR_PRNOM: json['SVR_PRNOM'],
      PLATPHD_UIDF: json['PLATPHD_UIDF'],
      PLATPHD_IDF: json['PLATPHD_IDF'],
      PPLATPHD_IDF: json['PPLATPHD_IDF'],
      TPH_IDF: json['TPH_IDF'],
      SVR_IDF: json['SVR_IDF'],
      PLATPH_START_HOUR:json['PLATPH_START_HOUR']!=null&& json['PLATPH_START_HOUR'].toString().isNotEmpty ? dateTimeFormat.parse(json['PLATPH_START_HOUR']):null,
      PLATPH_END_HOUR:json['PLATPH_END_HOUR'] != null&& json['PLATPH_END_HOUR'].toString().isNotEmpty ? dateTimeFormat.parse(json['PLATPH_END_HOUR']):null,
      PLATPH_MMO: json['PLATPH_MMO'],
      PLATPH_MMO2: json['PLATPH_MMO2'],
      PLATPH_ETAT: json['PLATPH_ETAT'],
      PLATPH_DEMAND_DATE:json['PLATPH_DEMAND_DATE'] != null && json['PLATPH_DEMAND_DATE'].toString().isNotEmpty? dateTimeFormat.parse(json['PLATPH_DEMAND_DATE']):null,
      PLATPH_ETAT_DATE:json['PLATPH_ETAT_DATE'] != null && json['PLATPH_ETAT_DATE'].toString().isNotEmpty ? dateTimeFormat.parse(json['PLATPH_ETAT_DATE']):null,
      MAIL_IDF: json['MAIL_IDF'],
      SMS_IDF: json['SMS_IDF'],
      PLATPH_VAC_IDF: json['PLATPH_VAC_IDF'],
      LAST_UPDT: dateTimeFormat.parse(json['LAST_UPDT']),
      USER_IDF: json['USER_IDF'],
      USR_CODE: json['USR_CODE'],
      CLR_CODE_colorweb: json['CLR_CODE_colorweb'],
    );
  }

  static List<AbsenceModel> convertDynamicToList(List<dynamic> data) {
    List<AbsenceModel> list = [];
    for (var i = 0; i < data.length; i++) {
      list.add(AbsenceModel.fromJson(data[i]));
    }
    return list;
  }
}
