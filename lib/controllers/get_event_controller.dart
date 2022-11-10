import 'dart:developer';

import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

class GetEventController extends GetxController {
  var scopes = ['https://www.googleapis.com/auth/userinfo.email'];
  // var scopes = [CalendarApi.calendarScope];

  ClientId? credential;
  // insert event
  getEvents() {
    try {
      credential = ClientId(
          '988812201151-f63qqds6eon1c1p0c8emvro5cd7lni5c.apps.googleusercontent.com',
          '');
      clientViaUserConsent(credential!, scopes, prompt)
          .then((AuthClient client) {
        var calendar = CalendarApi(client);
        String calendarId = "primary";
        calendar.events.list(calendarId).then((value) {
          log(value.toString());
          events = value;
          event = value.items!;
          log('Number of events${event.length}');
          log(event[1].summary.toString());
          event.removeAt(0);
          event = event.reversed.toList();
          update();
        });
      });
    } catch (e) {
      log('Error creating event $e');
    }
  }

  void prompt(String url) async {
    log(url);
    launchUrl(Uri.parse(url));
  }

  late Events events;
  List<Event> event = [];
}
