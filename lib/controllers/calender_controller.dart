import 'dart:developer';

import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarController extends GetxController {
  var scopes = [CalendarApi.calendarScope];
  var credential;
  // insert event
  insertEvent(event) {
    try {
      credential = ClientId(
          '988812201151-le2usbe0m74pjjbdt9c3tm4p8jrfignh.apps.googleusercontent.com');
      clientViaUserConsent(credential, scopes, prompt)
          .then((AuthClient client) {
        var calendar = CalendarApi(client);
        String calendarId = "primary";
        calendar.events.insert(event, calendarId).then((value) {
          print("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            log('Event added in google calendar');
          } else {
            log("Unable to add event in google calendar");
          }
        });
      });
    } catch (e) {
      log('Error creating event $e');
    }
  }

  void prompt(String url) async {
    launchUrl(Uri.parse(url));
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
