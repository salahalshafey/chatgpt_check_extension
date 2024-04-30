import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/date_time_and_duration.dart';
import 'last_occupied_user_image.dart';
import 'my_switch.dart';

class CurrentChatGptState extends StatelessWidget {
  const CurrentChatGptState({
    super.key,
    required this.color,
    required this.lastOccupiedUserId,
    required this.lastOccupiedUserName,
    required this.switchState,
    required this.occupationDetails,
    required this.since,
    this.lastOccupationDuration,
    required this.onTap,
  });

  final Color color;
  final String lastOccupiedUserId;
  final String lastOccupiedUserName;
  final bool switchState;
  final String occupationDetails;
  final DateTime since;
  final Duration? lastOccupationDuration;

  /// onSwitchTap
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: LastOccupiedUserImage(lastOccupiedUserId: lastOccupiedUserId),
        ),
        MySwitch(
          switchState: switchState,
          color: color,
          lastOccupiedUserName: lastOccupiedUserName,
          onTap: onTap,
        ),
        Text(
          occupationDetails,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Tooltip(
          message: pastOrFutureTimeFromNow(since),
          child: Text(
            "Since ${DateFormat('dd MMM hh:mm a').format(since)}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
