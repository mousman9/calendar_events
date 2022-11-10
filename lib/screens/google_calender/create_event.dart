import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:intl/intl.dart';

import '../../controllers/calender_controller.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime? startDate;
  DateTime? endDate;
  String eventName = '';

  Event event = Event(); // Create object of event
  EventDateTime start = EventDateTime();
  EventDateTime end = EventDateTime();

  TextEditingController nameController = TextEditingController();

  var controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Create Event',
            style: headingText(17),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text(
                'Start Time: ',
                style: normalText(16),
              ),
              startDate != null
                  ? InkWell(
                      onTap: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2022, 10, 7),
                            maxTime: DateTime(2025, 6, 7),
                            onChanged: (date) {}, onConfirm: (date) {
                          setState(() {
                            startDate = date;
                            start.dateTime = startDate;
                            start.timeZone = "GMT+05:00";
                            event.start = start;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        '${DateFormat.yMEd().format(startDate!)} at ${DateFormat.jm().format(startDate!)}',
                        style: headingText(16),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2022, 10, 7),
                            maxTime: DateTime(2025, 6, 7),
                            onChanged: (date) {}, onConfirm: (date) {
                          setState(() {
                            startDate = date;
                            start.dateTime = startDate;
                            start.timeZone = "GMT+05:00";
                            event.start = start;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: const Text('select date'),
                    )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'End Time:   ',
                style: normalText(16),
              ),
              endDate != null
                  ? InkWell(
                      onTap: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2022, 10, 7),
                            maxTime: DateTime(2025, 6, 7),
                            onChanged: (date) {}, onConfirm: (date) {
                          setState(() {
                            endDate = date;
                            end.timeZone = "GMT+05:00";
                            end.dateTime = endDate;
                            event.end = end;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        '${DateFormat.yMEd().format(endDate!)} at ${DateFormat.jm().format(endDate!)}',
                        style: headingText(16),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2022, 10, 7),
                            maxTime: DateTime(2025, 6, 7),
                            onChanged: (date) {}, onConfirm: (date) {
                          setState(() {
                            endDate = date;
                            end.timeZone = "GMT+05:00";
                            end.dateTime = endDate;
                            event.end = end;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: const Text('select date'),
                    )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppConstants.textfield,
                borderRadius: BorderRadius.circular(5)),
            // padding: EdgeInsets.all(8),
            child: TextField(
              style: normalText(14).copyWith(color: AppConstants.white),
              controller: nameController,
              decoration: InputDecoration(
                  hintStyle: normalText(14).copyWith(color: AppConstants.white),
                  hintText: 'Event Name',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (startDate == null ||
                    endDate == null ||
                    nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('PLease fill all fields')));
                } else if (endDate!.isBefore(startDate!)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('End Time should come after start time')));
                } else {
                  event.summary = nameController.text;
                  controller.insertEvent(event);
                }
              },
              child: const Text('Create Event'))
        ],
      ),
    );
  }
}
