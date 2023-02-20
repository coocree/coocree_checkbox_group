import 'package:coocree_radio_group/package.dart';
import 'package:flutter/material.dart';

// O RadioItem representa um item de radio button em um grupo de radio buttons
class CheckBoxItem<T> extends StatefulWidget {

  // A opção selecionável do item do radio button
  final OptionItem optionItem;

  // Função chamada quando o item do radio button é alterado
  final List<OptionItem>? listOptionsItem;


  // Função chamada quando o item do radio button é alterado
  final ValueChanged<List<OptionItem>?>? onChanged;

  // O estado do formulário ao qual o grupo de radio buttons pertence
  final FormFieldState<List<OptionItem>> state;

  const CheckBoxItem({
    Key? key,
    required this.optionItem,
    required this.onChanged,
    required this.state,
    required this.listOptionsItem,
  }) : super(key: key);

  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

// Estado do widget RadioItem
class _CheckBoxItemState extends State<CheckBoxItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Radio button para selecionar a opção
        Checkbox(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          // O valor da opção do item do radio button
          value: widget.optionItem.value,
          onChanged: (value) {
            // Chama a função onChanged quando o valor é alterado
            widget.optionItem.value = value;
            widget.onChanged!(widget.listOptionsItem);
            widget.state.didChange(widget.listOptionsItem);
            widget.state.validate();
          },
        ),
        // Texto para exibir a opção
        InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            widget.optionItem.value = !widget.optionItem.value;
            // Chama a função onChanged quando o texto é clicado
            widget.onChanged!(widget.listOptionsItem);
            widget.state.didChange(widget.listOptionsItem);
            widget.state.validate();
          },
          child: Text(widget.optionItem.label),
        ),
      ],
    );
  }
}
