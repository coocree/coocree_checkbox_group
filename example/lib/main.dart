import 'package:coocree_radio_group/package.dart';
import 'package:flutter/material.dart';

//O código cria um aplicativo Flutter com uma página que contém um formulário que utiliza o widget
// SimpleCheckBoxFormField para exibir um grupo de radio buttons.
//
// Função principal do aplicativo Flutter
void main() {
  runApp(const Example());
}

// Example cria o aplicativo e define o tema
class Example extends StatelessWidget {
  const Example({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExamplePage(),
    );
  }
}

// Widget que exibe a página com o formulário
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

// Estado do widget ExamplePage
class _ExamplePageState extends State<ExamplePage> {
  // Chave global para o formulário
  final formKey = GlobalKey<FormState>();
  final List<OptionItem> listOptionItem = [
    OptionItem(label: "Pedidos", value: false, id: "pedidos"),
    OptionItem(label: "Manutenção", value: false, id: "manutencao"),
    OptionItem(label: "Atendimento", value: false, id: "atendimento"),
    OptionItem(label: "Entrega", value: false, id: "entrega"),
    OptionItem(label: "PedidosA", value: false, id: "pedidosA"),
    OptionItem(label: "ManutençãoA", value: false, id: "manutencaoA"),
    OptionItem(label: "AtendimentoA", value: false, id: "atendimentoA"),
    OptionItem(label: "EntregaA", value: false, id: "entregaA"),
  ];
  final List<OptionItem> listOptionSelectedItem = [
    OptionItem(label: "Pedidos", value: true, id: "pedidos"),
    OptionItem(label: "Manutenção", value: true, id: "manutencao"),
    OptionItem(label: "AtendimentoA", value: true, id: "atendimentoA"),
    OptionItem(label: "EntregaA", value: true, id: "entregaA"),
  ];

  final List<OptionItem> listRadio = [
    OptionItem(id: "Listen", label: "Listen", value: "listen"),
    OptionItem(id: "Hear", label: "Hear", value: "hear"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SearchableDropdown(
                      items: ["Item1", "Item2", 'Item3', "Item4", "Item5", 'k1'],
                      hintText: "Componentes",
                    ),
                    const SizedBox(height: 20),
                    const DropFormItem(
                      hintText: "Defeitos",
                      items: [
                        'Teste1',
                        'Teste2',
                        'Teste3',
                      ],
                    ),
                    SimpleRadioFormField(
                      options: listRadio,
                      validator: (value) {
                        print("VALIDATOR-->>$value");
                        if (value == null) {
                          return 'Por favor selecione um produto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print("ONCHANGED-->>$value");
                      },
                      onSaved: (value) {
                        print("ONSAVED-->$value");
                      },
                    ),
                    SimpleCheckBoxFormField(
                      initialValue: listOptionSelectedItem,
                      options: listOptionItem,
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor selecione um produto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print("ONCHANGED-->>$value");
                      },
                      onSaved: (value) {
                        print("ONSAVED-->$value");
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
