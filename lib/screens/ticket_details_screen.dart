
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({Key? key}) : super(key: key);

  @override
  _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
        "Mobile Tickets",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    ),
    elevation: 0.0,
    ));
  }
}
