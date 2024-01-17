import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti_app/presentation/config/app_colors.dart';

import '../../widgets/message/message_widget.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  late final List<String> _history;
  HistoryScreen({super.key, required int minute}) {
    _history = List.generate(2, (_) => '$minute Minute');
  }

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // context.pop();
          },
        ),
        title: const Text('Notifications',
            style: TextStyle(color: AppColors.whiteColor)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
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
                backgroundColor: AppColors.borderColor,
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
                    colorFilter: const ColorFilter.mode(
                        AppColors.whiteColor, BlendMode.srcIn),
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Add new notification',
                    style: TextStyle(color: AppColors.whiteColor),
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
