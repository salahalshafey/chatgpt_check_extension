import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({
    super.key,
    required this.switchState,
    required this.color,
    required this.lastOccupiedUserName,
    required this.onTap,
  });

  final bool switchState;
  final Color color;
  final String lastOccupiedUserName;
  final void Function() onTap;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  late bool _currentSwitchState = widget.switchState;

  void _toggelSwitch() {
    if (widget.switchState == false) {
      return;
    }

    setState(() {
      _currentSwitchState = !_currentSwitchState;
    });
  }

  String _getToolTipMessage() {
    if (widget.switchState == false) {
      return "Wait for ${widget.lastOccupiedUserName} to finish";
    }

    if (widget.color == Colors.green) {
      return "Start Occupying ChatGPT";
    }

    return "Stop Occupying ChatGPT";
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _getToolTipMessage(),
      child: Switch(
        value: _currentSwitchState,
        activeColor: widget.color,
        //inactiveThumbColor: Colors.red,
        onChanged: (bool value) {
          _toggelSwitch();

          widget.onTap();
        },
      ),
    );
  }
}
