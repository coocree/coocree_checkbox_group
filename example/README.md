# SimpleCheckBoxFormField

O `SimpleCheckBoxFormField` é um widget que permite exibir um grupo de radio buttons em uma grade simples. Este widget é especialmente útil quando se deseja limitar as opções selecionáveis e apresentá-las de forma organizada e fácil de usar.

## Como utilizar

Para utilizar o componente `SimpleCheckBoxFormField` em seu projeto Flutter, siga os passos abaixo:

1. Adicione o pacote `coocree_radio_group` ao seu `pubspec.yaml`.

```yaml
   dependencies:
   coocree_radio_group: ^0.2.2
```

2. Importe os pacotes necessários em seu arquivo Dart.

```dart
import 'package:coocree_radio_group/package.dart';
import 'package:flutter/material.dart';
```

3. Adicione o widget `SimpleCheckBoxFormField` em seu formulário.

```dart
Form(
  child: Column(
    children: [
      SimpleCheckBoxFormField(
        options: [
          OptionItem(label: "Opção 1", value: "opcao1"),
          OptionItem(label: "Opção 2", value: "opcao2"),
          OptionItem(label: "Opção 3", value: "opcao3"),
        ],
        validator: (value) {
          if (value == null) {
            return 'Por favor selecione uma opção';
          }
          return null;
        },
        onChanged: (value) {
          print("A opção selecionada é: $value");
        },
        onSaved: (value) {
          print("A opção selecionada foi salva: $value");
        },
      ),
    ],
  ),
);
```

O exemplo acima exibe um `SimpleCheckBoxFormField` com três opções de seleção e funções de validação, salvamento e alteração. O resultado final será uma lista de radio buttons organizada em uma grade simples.

Lembre-se de utilizar o `Form` em conjunto com o `SimpleCheckBoxFormField` para que as funções de validação e salvamento possam ser implementadas corretamente.
