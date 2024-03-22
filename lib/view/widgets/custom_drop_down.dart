import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> options;
  final String selectedOption;
  final String hint;
  final Function(String) onChanged;
  final Key? key; // Make the key parameter optional

  CustomDropdownMenu({
    this.key,
    required this.options,
    required this.selectedOption,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? _selectedOption; // Change type to String?

  @override
  void initState() {
    super.initState();
    _selectedOption = null; // Set initial value to null
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedOption,
      onChanged: (newValue) {
        setState(() {
          _selectedOption = newValue!;
        });
        widget.onChanged(newValue!);
      },
      items: [
        if (widget.hint != null)
          DropdownMenuItem(
            value: null,
            child: Text(widget.hint),
          ),
        ...widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Color(0XFF39a8ed),
              ),
            ),
          );
        }),
      ],
    );
  }
}
