import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/message/message_widget.dart';

class HistoryScreen extends StatefulWidget {
  late final List<String> _history;
  HistoryScreen({super.key, required int minute}) {
    _history = List.generate(minute, (index) => '${index + 1} Minute');
  }

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Notifications', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          Expanded(
            child: _buildOneTimeList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOneTimeList() {
    return ListView.builder(
      itemCount: widget._history.length + 1,
      itemBuilder: (context, index) {
        if (index == widget._history.length) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A4DBA),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svg/add_circle.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Add new notification',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: MessageWidget(
              time: widget._history[index],
              message: 'Don’t forget do this',
              onSelectTrigger1: () {},
              onSelectTrigger2: () {},
              onDelete: () {},
            ),
          );
        }
      },
    );
  }
}
