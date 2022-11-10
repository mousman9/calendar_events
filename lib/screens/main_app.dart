import 'package:calendar_events/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'google_calender/create_event.dart';
import 'google_calender/get_events.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp>
    with SingleTickerProviderStateMixin {
  var controller = Get.put(CalenderAppController());

  @override
  void initState() {
    controller.tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, mainSize) {
        return SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
                Expanded(child: _tabBar()),
              ],
            ),
            GetBuilder<CalenderAppController>(builder: (value) {
              return Visibility(
                visible: value.tabIndex == 0,
                child: const Expanded(child: CreateEvent()),
              );
            }),
            GetBuilder<CalenderAppController>(builder: (value) {
              return Visibility(
                visible: value.tabIndex == 1,
                child: const Expanded(child: GetMyEvents()),
              );
            }),
          ],
        ));
      }),
    );
  }

  // Container _drawer() {
  //   return Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     color: const Color(0xff151a2e),
  //     child: GetBuilder<CalenderAppController>(builder: (value) {
  //       return Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               if (value.pic.isNotEmpty)
  //                 CircleAvatar(
  //                   radius: 35,
  //                   child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(200),
  //                       child: Image.network(value.pic)),
  //                 ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               Text(
  //                 'Hello',
  //                 style: normalText(18).copyWith(color: Colors.white),
  //               ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               Text(
  //                 value.name,
  //                 style: normalText(18).copyWith(color: Colors.yellow),
  //               ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               Text(
  //                 '(${value.email})',
  //                 style: normalText(16).copyWith(color: Colors.orange),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               SizedBox(
  //                 width: 150,
  //                 child: PrimaryButton(
  //                     label: 'Sign out',
  //                     onPress: () {
  //                       controller.signout();
  //                     }),
  //               )
  //             ],
  //           ),
  //           Positioned(
  //             top: 20,
  //             right: 20,
  //             child: SafeArea(
  //                 child: IconButton(
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               icon: const Icon(
  //                 Icons.close,
  //                 color: Colors.white,
  //               ),
  //             )),
  //           )
  //         ],
  //       );
  //     }),
  //   );
  // }

  GetBuilder<CalenderAppController> _tabBar() {
    return GetBuilder<CalenderAppController>(
        init: CalenderAppController(),
        builder: (value) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: TabBar(
              onTap: (index) => value.changeIndex(index),

              indicatorColor: Colors.white,

              isScrollable: true,
              indicatorPadding: const EdgeInsets.only(
                left: 5,
                right: 20,
              ),
              padding: EdgeInsets.zero,
              labelPadding:
                  const EdgeInsets.only(left: 5, right: 20, bottom: 5),
              labelColor: Colors.white,

              unselectedLabelColor: Colors.grey,
              // indicator:
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Text(
                  'Create Event',
                ),
                Text(
                  'My Events',
                ),
              ],
              controller: value.tabController,
            ),
          );
        });
  }
}
