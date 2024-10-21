import 'package:coocree_radio_group/package.dart';
import 'package:coocree_radio_group/src/simple_checkbox_list/row_and_column.dart';
import 'package:flutter/material.dart';

// Widget que exibe um grupo de radio buttons em uma grade simples
class SimpleCheckBoxFormField extends FormField<List<OptionItem>> {
  // O valor inicial do formulário
  final List<OptionItem>? initialValue;

  // As opções a serem exibidas
  final List<OptionItem> options;

  // A largura mínima do item do radio button
  final double minWidth;

  // A largura máxima do item do radio button
  final double maxWidth;

  // O texto de erro a ser exibido
  final String? errorText;

  // Função chamada quando um item do radio button é alterado
  final ValueChanged<List<OptionItem>?>? onChanged;

  SimpleCheckBoxFormField({
    Key? key,
    FormFieldSetter<List<OptionItem>>? onSaved,
    FormFieldValidator<List<OptionItem>>? validator,
    this.initialValue,
    required this.options,
    this.minWidth = 230,
    this.maxWidth = 230,
    this.errorText,
    this.onChanged,
  }) : super(
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue,
    builder: (FormFieldState<List<OptionItem>> state) {
      // Método que constrói a grade de radio buttons
      dynamic rowAndColumn(BoxConstraints constraints) {
        int maxColumns = (constraints.maxWidth / maxWidth).round();
        double columnMaxWidth = constraints.maxWidth / maxColumns;

        BoxConstraints boxConstraints = BoxConstraints(maxWidth: columnMaxWidth);
        if (boxConstraints.maxWidth > maxWidth) {
          boxConstraints = BoxConstraints(maxWidth: maxWidth);
        }

        return RowAndColumn(
          initialValue: initialValue,
          options: options,
          maxColumns: maxColumns,
          constraints: boxConstraints,
          width: (constraints.maxWidth / maxColumns),
          state: state,
          onChanged: onChanged,
        );
      }

      // Usa um LayoutBuilder para passar as restrições de tamanho para o método rowAndColumn
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return rowAndColumn(constraints);
        },
      );
    },
  );
}
