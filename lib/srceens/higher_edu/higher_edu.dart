import 'package:flutter/material.dart';

import '../../utils/res_colors.dart';

class HigherEducationPage extends StatelessWidget {
  const HigherEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Oliy ta'lim"),
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            indicatorColor: ResColors.whiteColor,
            labelColor: ResColors.primaryColor,
            dividerColor: Colors.white,
            isScrollable: true,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Tab(
                    child: Center(
                        child: Text("Umumiy",
                            style: TextStyle(fontSize: 15)))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Tab(
                    child: Center(
                        child: Text("Talabalar",
                            style: TextStyle(fontSize: 15)))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Tab(
                    child: Center(
                        child: Text("O'qituvchilar",
                            style: TextStyle(fontSize: 15)))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Tab(
                    child: Center(
                        child: Text("OTMlar ro'yxati",
                            style: TextStyle(fontSize: 15)))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Tab(
                    child: Center(
                        child: Text("Jadvallar",
                            style: TextStyle(fontSize: 15)))),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("Umumiy")
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("Talabalar")
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("O'qituvchilar")
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("OTMlar ro'yxati")
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("Jadvallar")
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
