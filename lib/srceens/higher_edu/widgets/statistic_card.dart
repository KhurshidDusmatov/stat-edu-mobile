import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final String text;

  const StatisticCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        height: 52,
        width: MediaQuery.sizeOf(context).width - 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Text(text, style: TextStyle(fontSize: 13)),
        ),
      ),
    );
  }
}
