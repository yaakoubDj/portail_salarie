import 'package:flutter/material.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/helper/GBSystem_text_helper.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/models/SERVER_MODELS/GBSystem_type_absence_model.dart';

class GBSystem_Root_CardViewWidget extends StatelessWidget {
  const GBSystem_Root_CardViewWidget({
    super.key,
    required this.site,
    this.onTap,
    this.tileColor,
  });
  final TypeAbsenceModel site;
  final Color? tileColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: tileColor),
      child: ListTile(
        onTap: onTap,
        isThreeLine: true,
        title: Text(
          site.TPH_LIB,
          maxLines: 2,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              site.TPH_LIB,
              maxLines: 2,
            ),
            Text(
              site.TPH_CODE,
              maxLines: 2,
            ),
            // Text(site.TPH_LIB),
          ],
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: GBSystem_TextHelper().normalText(
              text: site.TPH_LIB.substring(0, 1).toUpperCase(),
              textColor: Colors.white),
        ),
        // trailing: Text(site.TPH_LIB),
      ),
    );
  }
}
