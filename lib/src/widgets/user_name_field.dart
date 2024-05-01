import 'package:flutter/material.dart';

import '../utils/user.dart';

class UserNameField extends StatefulWidget {
  const UserNameField({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  State<UserNameField> createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  late final _controller = TextEditingController(text: widget.userName);
  bool _isEditing = false;

  void _toggelNameEditing() {
    if (_isEditing) {
      setUserName(_controller.text);

      setState(() {
        _isEditing = false;
      });
    } else {
      setState(() {
        _isEditing = true;
      });

      _controller.selection =
          TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _isEditing
            ? SizedBox(
                width: 110,
                height: 30,
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  onEditingComplete: _toggelNameEditing,
                  decoration: const InputDecoration(hintText: "Your Name"),
                ),
              )
            : Text(_controller.text),
        const SizedBox(width: 15),
        IconButton(
          onPressed: _toggelNameEditing,
          tooltip: _isEditing ? "Save" : "Edit your name",
          icon: Icon(_isEditing ? Icons.check : Icons.edit),
        ),
      ],
    );
  }
}
