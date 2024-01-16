import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _hourController1 = TextEditingController();
  final TextEditingController _hourController2 = TextEditingController();
  final TextEditingController _minuteController1 = TextEditingController();
  final TextEditingController _minuteController2 = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  bool _isErrorVisible = false;

  void _validateTime() {
    if (_hourController1.text.isEmpty || _minuteController1.text.isEmpty) {
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
  void initState() {
    super.initState();

    _hourController1.addListener(() {
      if (_hourController1.text.length == 1) {
        FocusScope.of(context).requestFocus(_focusNode1);
      }
    });

    _hourController2.addListener(() {
      if (_hourController2.text.length == 1) {
        FocusScope.of(context).requestFocus(_focusNode2);
      }
    });

    _minuteController1.addListener(() {
      if (_minuteController1.text.length == 1) {
        FocusScope.of(context).requestFocus(_focusNode3);
      }
    });
  }

  @override
  void dispose() {
    _hourController1.removeListener(() {});
    _hourController1.dispose();
    _focusNode1.dispose();

    _hourController2.removeListener(() {});
    _hourController2.dispose();
    _focusNode2.dispose();

    _minuteController1.removeListener(() {});
    _minuteController1.dispose();
    _focusNode3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
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
                    _buildTimeInputField(_hourController1, _focusNode1),
                    const SizedBox(width: 12),
                    _buildTimeInputField(_hourController2, _focusNode2),
                    const SizedBox(width: 11),
                    const Text(':',
                        style:
                            TextStyle(fontSize: 32, color: Color(0xFFE6E6E6))),
                    const SizedBox(width: 11),
                    _buildTimeInputField(_minuteController1, _focusNode3),
                    const SizedBox(width: 12),
                    _buildTimeInputField(_minuteController2, _focusNode4),
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

  Widget _buildTimeInputField(
    TextEditingController controller,
    FocusNode focusNode,
  ) {
    return Container(
      width: 44,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white, //
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE6E6E6),
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1717),
            height: 24 / 16,
          ),
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          onChanged: (String value) {
            if (value.length == 1) {
              focusNode.nextFocus();
            }
          }),
    );
  }
}
