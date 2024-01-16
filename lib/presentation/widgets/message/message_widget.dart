import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti_app/presentation/widgets/hover_button/hover_button_widget.dart';

class MessageWidget extends StatelessWidget {
  final String _time;
  final String _message;
  final VoidCallback _onSelectTrigger1;
  final VoidCallback _onSelectTrigger2;
  final VoidCallback _onDelete;

  const MessageWidget({
    super.key,
    required String time,
    required String message,
    required void Function() onSelectTrigger1,
    required void Function() onSelectTrigger2,
    required void Function() onDelete,
  })  : _onDelete = onDelete,
        _onSelectTrigger2 = onSelectTrigger2,
        _onSelectTrigger1 = onSelectTrigger1,
        _message = message,
        _time = time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFB),
        border: Border.all(color: const Color(0xFF6A4DBA), width: 1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      // color: ,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HoverButton(
                      icon: SvgPicture.asset(
                        'assets/svg/business_icon.svg',
                        width: 24.0,
                        height: 24.0,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF6A4DBA),
                          BlendMode.srcIn,
                        ),
                      ),
                      borderColor: const Color(0xFF6A4DBA),
                      backgroundColor: const Color(0xFFF8FAFB),
                      onPressed: () {},
                      width: 32.0,
                      height: 32.0),
                  HoverButton(
                    icon: SvgPicture.asset(
                      'assets/svg/delete_forever_icon.svg',
                      width: 24.0,
                      height: 24.0,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                    ),
                    borderColor: const Color(0xFFF8FAFB),
                    backgroundColor: const Color(0xFFF8FAFB),
                    onPressed: _onDelete,
                    width: 32.0,
                    height: 32.0,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Time: ',
                      style: TextStyle(
                          color: Color(0xFF747377),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text(
                    _time,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Message: ',
                    style: TextStyle(
                        color: Color(0xFF747377),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    _message,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onSelectTrigger1,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFF8FAFB)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF6A4DBA)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 40)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xFF6A4DBA)),
                          ),
                        ),
                      ),
                      child: const Text('Select trigger 1',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF6A4DBA))),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onSelectTrigger2,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFF8FAFB)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF6A4DBA)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 40)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xFF6A4DBA)),
                          ),
                        ),
                      ),
                      child: const Text('Select trigger 2',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF6A4DBA))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
