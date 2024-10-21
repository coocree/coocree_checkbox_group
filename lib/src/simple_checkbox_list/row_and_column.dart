import 'package:coocree_radio_group/package.dart';
import 'package:coocree_radio_group/src/simple_checkbox_list/checkbox_item.dart';
import 'package:flutter/material.dart';

// RowAndColumn exibe uma lista de radio buttons em uma grade de linhas e colunas
class RowAndColumn extends StatefulWidget {
  // As restrições de tamanho da grade
  final BoxConstraints constraints;

  // O valor inicial do formulário
  final List<OptionItem>? initialValue;

  // O número máximo de colunas na grade
  final int maxColumns;

  // As opções a serem exibidas
  final List<OptionItem> options;

  // O estado do formulário ao qual o grupo de radio buttons pertence
  final FormFieldState<List<OptionItem>> state;

  // A largura do item do radio button
  final double width;

  // Função chamada quando um item do radio button é alterado
  final ValueChanged<List<OptionItem>?>? onChanged;

  const RowAndColumn({
    Key? key,
    required this.constraints,
    required this.maxColumns,
    required this.options,
    required this.state,
    required this.width,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<RowAndColumn> createState() => _RowAndColumnState();
}

// Estado do widget RowAndColumn
class _RowAndColumnState extends State<RowAndColumn> {
  void isChecked(OptionItem optionItem) {
    for (OptionItem optionSelectedItem in widget.initialValue!) {
      if (optionSelectedItem.id == optionItem.id) {
        optionItem.value = optionSelectedItem.value;
      }
    }
  }

  void prepareChecked() {
    for (var optionItem in widget.options) {
      isChecked(optionItem);
    }
  }

  @override
  void initState() {
    prepareChecked();
    super.initState();
  }

  // Método que constrói a grade de linhas e colunas
  Column buildWidget() {
    List<Widget> listChildren = [];
    int len = widget.options.length;
    int maxItems = len % widget.maxColumns;

    // Percorre as opções e agrupa-as em linhas
    for (int i = 0; i < len - maxItems; i += widget.maxColumns) {
      List listGroup = widget.options.sublist(i, i + widget.maxColumns);
      List<Widget> listLabelValue = [];
      for (OptionItem optionItem in listGroup) {
        // Cria um item do radio button e adiciona à linha
        Widget item = Container(
          width: widget.width,
          constraints: BoxConstraints(maxWidth: widget.constraints.maxWidth),
          child: CheckBoxItem(
            state: widget.state,
            optionItem: optionItem,
            listOptionsItem: widget.options,
            onChanged: (value) {
              widget.onChanged!(widget.options);
            },
          ),
        );
        listLabelValue.add(item);
      }
      listChildren.add(Row(children: listLabelValue));
    }

    // Adiciona as opções restantes em uma linha final
    if (maxItems != 0) {
      List listGroup = widget.options.sublist(widget.options.length - maxItems);
      List<Widget> listLabelValue = [];
      for (var element in listGroup) {
        // Cria um item do radio button e adiciona à linha final
        Widget item = Container(
          width: widget.width,
          constraints: BoxConstraints(maxWidth: widget.constraints.maxWidth),
          child: CheckBoxItem(
            listOptionsItem: widget.options,
            state: widget.state,
            optionItem: element,
            onChanged: (value) {
              widget.onChanged!(widget.options);
            },
          ),
        );
        listLabelValue.add(item);
      }
      listChildren.add(Row(children: listLabelValue));
    }

    // Adiciona uma mensagem de erro se houver erro no estado do formulário
    if (widget.state.hasError) {
      listChildren.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          widget.state.errorText!,
          style: const TextStyle(color: Colors.red),
        ),
      ));
    }

    return Column(
      children: listChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildWidget();
  }
}
