import 'package:flutter/material.dart';

import '../../widgets/time_input/time_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isErrorVisible = false;
  String _hour = '';
  String _minute = '';

  void _validateTime() {
    if (_hour.isEmpty || _minute.isEmpty) {
      setState(() {
        _isErrorVisible = true;
      });
    } else {
      setState(() {
        _isErrorVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 72),
                const Text('Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, color: Colors.black)),
                const SizedBox(height: 16),
                const Text('Enter current time in hh : mm format',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFF747377))),
                const SizedBox(height: 42),
                const Text('12:59',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, color: Colors.black)),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TimeInputWidget(
                      onTimeSelected: (h, m) {
                        setState(() {
                          _hour = h;
                          _minute = m;
                        });
                      },
                    )
                  ],
                ),
                if (_isErrorVisible) ...[
                  const SizedBox(height: 20),
                  const Text('The time is wrong. Try again.',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                      textAlign: TextAlign.center),
                ],
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 34, left: 16, right: 16),
              child: ElevatedButton(
                onPressed: _validateTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A4DBA),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Confirm',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 24 / 16,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
