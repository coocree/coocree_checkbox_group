import 'package:coocree_radio_group/package.dart';
import 'package:coocree_radio_group/src/simple_checkbox_list/checkbox_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /*testWidgets('Test RadioItem', (WidgetTester tester) async {
    // Cria uma chave única para o widget
    final key = Key('radio_item');

    // Cria uma instância de FormFieldState para o teste
    final formFieldState = FormFieldState<String>(
        *//*validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },*//*
        );

    // Define as opções disponíveis
    final optionItems = [
      OptionItem(label: 'Opção 1', value: '1'),
      OptionItem(label: 'Opção 2', value: '2'),
    ];

    // Define o valor do grupo de radio buttons
    final groupValue = '1';

    // Define a opção selecionável
    final optionItem = optionItems[1];

    // Define a função onChanged
    String? selectedValue;
    void onChanged(String? value) {
      selectedValue = value;
    }

    // Cria o widget RadioItem com os valores definidos acima
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RadioItem(
            key: key,
            groupValue: groupValue,
            optionItem: optionItem,
            onChanged: onChanged,
            state: formFieldState,
          ),
        ),
      ),
    );

    // Verifica se o widget é renderizado corretamente
    expect(find.byKey(key), findsOneWidget);

    // Verifica se a opção selecionável é exibida corretamente
    expect(find.text(optionItem.label), findsOneWidget);

    // Verifica se o Radio button é renderizado corretamente
    expect(find.byType(Radio), findsOneWidget);

    // Simula o toque no Radio button
    await tester.tap(find.byType(Radio));

    // Reconstroi o widget
    await tester.pump();

    // Verifica se a função onChanged é chamada corretamente
    expect(selectedValue, optionItem.value);
  });*/
}
