import 'package:flutter/material.dart';

import '../../package.dart';

class ExportRelatory extends StatefulWidget {
  const ExportRelatory({super.key});

  @override
  State<ExportRelatory> createState() => _ExportRelatoryState();
}

class _ExportRelatoryState extends State<ExportRelatory> {
  final List<OptionItem> listRadio = [
    OptionItem(id: "geral", label: "Geral", value: "geral"),
    OptionItem(id: "ar", label: "AR", value: "ar"),
  ];

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SimpleRadioFormField(
              options: listRadio,
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
              const Column(
                children: [
                  SearchableDropdown(
                    hintText: "Componentes",
                    items: ["Item1", "Item2", 'Item3', "Item4", "Item5", 'k1'],
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
