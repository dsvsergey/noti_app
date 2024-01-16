import 'package:flutter/material.dart';
import 'package:noti_app/presentation/widgets/message/message_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MessageWidget(
                time: '12:00',
                message: 'Message 1',
                onSelectTrigger1: () {},
                onSelectTrigger2: () {},
                onDelete: () {},
              ),
            ],
          ),
        ));
  }
}
