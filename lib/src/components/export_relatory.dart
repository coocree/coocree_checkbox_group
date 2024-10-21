import 'package:flutter/material.dart';

import '../../package.dart';

class ExportRelatory extends StatefulWidget {
  final String searchbleHintText;
  final List<OptionItem> listRadio;
  final List<dynamic> searchableDropdown;
  const ExportRelatory({
    super.key,
    required this.listRadio,
    required this.searchableDropdown,
    required this.searchbleHintText,
  });

  @override
  State<ExportRelatory> createState() => _ExportRelatoryState();
}

class _ExportRelatoryState extends State<ExportRelatory> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SimpleRadioFormField(
              options: widget.listRadio,
              validator: (value) {
                if (value == null) {
                  return 'Por favor selecione um produto';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
              onSaved: (value) {
                print("ONSAVED-->$value");
              },
            ),
            const SizedBox(height: 20),
            if (selectedOption == "geral")
              Column(
                children: [
                  SearchableDropdown(
                    hintText: widget.searchbleHintText,
                    items: widget.searchableDropdown,
                  ),
                  DropFormItem(
                    hintText: "Defeitos",
                    items: [
                      'Teste1',
                      'Teste2',
                      'Teste3',
                    ],
                  ),
                ],
              )
            else if (selectedOption == "ar")
              const DropFormItem(
                hintText: "Defeitos",
                items: [
                  'Teste1',
                  'Teste2',
                  'Teste3',
                ],
              ),
          ],
        ),
      ),
    );
  }
}
