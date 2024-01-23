import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:noti_app/presentation/config/app_colors.dart';

@RoutePage()
class SelectTriggerScreen extends StatefulWidget {
  const SelectTriggerScreen({super.key});

  @override
  State<SelectTriggerScreen> createState() => _SelectTriggerScreenState();
}

class _SelectTriggerScreenState extends State<SelectTriggerScreen> {
  Map<String, bool> values = {
    'Biking': false,
    'Running': false,
    'Ping Pong': true,
    'Volleyball': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select trigger 2'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
      body: ListView(
        children: const <Widget>[],
      ),
    );
  }
}
