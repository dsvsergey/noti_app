import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:noti_app/presentation/models/notification.dart';
import 'package:noti_app/presentation/screens/home/cubit/home_cubit.dart';
import 'package:noti_app/presentation/widgets/message/message_widget.dart';

import '../../widgets/custom_toggle_buttons/custom_toggle_buttons_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<NotificationModel> _messages = [
    NotificationModel(
      time: '21:10',
      message: 'Don’t forget do this',
    ),
    NotificationModel(
      time: '21:10',
      message: 'Don’t forget do this',
    )
  ];

  final List<String> _history = [
    '1 Minute',
    '3 Minute',
    '1 Minute',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Notifications',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomToggleButtonsWidget(
                            onSelected: (index) {
                              if (index == 0) {
                                context.read<HomeCubit>().oneTimeNotification();
                              } else {
                                context
                                    .read<HomeCubit>()
                                    .recurringNotification();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: state is OneTimeNotificationState
                        ? _buildOneTimeList()
                        : _buildHistoryList(),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget _buildOneTimeList() {
    return ListView.builder(
      itemCount: _messages.length + 1,
      itemBuilder: (context, index) {
        if (index == _messages.length) {
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
              time: _messages[index].time,
              message: _messages[index].message,
              onSelectTrigger1: () {},
              onSelectTrigger2: () {},
              onDelete: () {},
            ),
          );
        }
      },
    );
  }

  Widget _buildHistoryList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: _history.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Color(0xFFE6E6E6)),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 46,
          child: ListTile(
            title: Text(_history[index]),
            trailing: SvgPicture.asset(
              'assets/svg/arrow_back_ios_icon.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xFF6A4DBA), BlendMode.srcIn),
              width: 24.0,
              height: 24.0,
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
