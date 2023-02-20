import 'package:coocree_radio_group/package.dart';
import 'package:flutter/material.dart';

// O RadioItem representa um item de radio button em um grupo de radio buttons
class CheckBoxItem<T> extends StatefulWidget {

  // A opção selecionável do item do radio button
  final OptionItem optionItem;

  // Função chamada quando o item do radio button é alterado
  final ValueChanged<bool?>? onChanged;

  // O estado do formulário ao qual o grupo de radio buttons pertence
  final FormFieldState<bool> state;

  const CheckBoxItem({
    Key? key,
    required this.optionItem,
    required this.onChanged,
    required this.state,
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
            widget.onChanged!(value);
            widget.state.didChange(value);
            widget.state.validate();
          },
        ),
        // Texto para exibir a opção
        InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            // Chama a função onChanged quando o texto é clicado
            widget.onChanged!(widget.optionItem.value);
            widget.state.didChange(widget.optionItem.value);
            widget.state.validate();
          },
          child: Text(widget.optionItem.label),
        ),
      ],
    );
  }
}
