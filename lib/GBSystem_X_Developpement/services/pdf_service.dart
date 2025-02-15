import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/helper/GBSystem_snack_bar.dart';
import 'package:portail_salarie/_RessourceStrings/GBSystem_Application_Strings.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFService {
  Future<String> createFolder(String download) async {
    final dir = Directory((Platform.isAndroid
                ? await getExternalStorageDirectory() //FOR ANDROID
                : await getApplicationSupportDirectory() //FOR IOS
            )!
            .path +
        '/$download');
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await dir.exists())) {
      return dir.path;
    } else {
      dir.create();
      return dir.path;
    }
  }

  Future<void> downloadAndSavePDF(
      String fileName, Uint8List pdfBytes, BuildContext context,
      {bool addExtension = false}) async {
    var tempPath = await createFolder("download");
    var tempFile;
    if (addExtension) {
      tempFile = File('$tempPath/$fileName.pdf');
    } else {
      tempFile = File('$tempPath/$fileName');
    }

    tempFile.writeAsBytesSync(pdfBytes);

    try {
      // Get the directory where the PDF file will be saved
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/planningPDF.pdf';

      // Write the PDF bytes to a file
      File file = File(filePath);
      await file.writeAsBytes(pdfBytes, flush: true).then((value) {
        showSuccesDialog(
            context, GbsSystemStrings.str_file_uploaded_with_success.tr);
      });
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  Uint8List cleanPDFStringAndConvertToUnit8List({required String stringPDF}) {
    String cleanedString = stringPDF;

    /// first cond

    if (stringPDF.startsWith('data:application/octet-stream;base64,')) {
      int entrerLength = 'data:application/octet-stream;base64,'.length;
      // print( stringPDF.substring(entrerLength));
      // print( stringPDF.substring(entrerLength,stringPDF.length));

      cleanedString = stringPDF.substring(entrerLength);
    } else {
      cleanedString = stringPDF;
    }
//second cond

    if (cleanedString.startsWith('data:application/pdf;base64,')) {
      int entrerLength = 'data:application/pdf;base64,'.length;
      // print( cleanedString.substring(entrerLength));
      // print( cleanedString.substring(entrerLength,cleanedString.length));

      cleanedString = cleanedString.substring(entrerLength);
    } else {
      cleanedString = cleanedString;
    }
    print("cleaned : $cleanedString");
    Uint8List bytes;

    bytes = base64Decode(cleanedString);

    return bytes;
  }
}
