import 'package:flutter/material.dart';

class DropFormItem extends StatefulWidget {
  final List<String> items;
  final String? hintText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;

  const DropFormItem({
    Key? key,
    required this.items,
    this.hintText,
    this.initialValue,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  DropFormItemState createState() => DropFormItemState();
}

class DropFormItemState extends State<DropFormItem> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      menuMaxHeight: 200,
      dropdownColor: const Color.fromARGB(255, 235, 235, 235),
      value: _selectedItem,
      hint: widget.hintText != null ? Text(widget.hintText!) : null,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      validator: widget.validator,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
