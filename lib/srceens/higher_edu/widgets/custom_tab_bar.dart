import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50); // TabBar balandligi

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      indicatorColor: Colors.white,
      labelColor: Colors.blue, // ResColors.primaryColor o'rniga
      dividerColor: Colors.white,
      isScrollable: true,
      tabs: [
        _buildTab("Umumiy"),
        _buildTab("Talabalar"),
        _buildTab("O'qituvchilar"),
        _buildTab("OTMlar ro'yxati"),
        _buildTab("Jadvallar"),
      ],
    );
  }

  Widget _buildTab(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Tab(child: Center(child: Text(title, style: TextStyle(fontSize: 14)))),
    );
  }
}
