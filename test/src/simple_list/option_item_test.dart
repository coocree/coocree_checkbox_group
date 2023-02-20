import 'package:coocree_radio_group/package.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OptionItem', () {
    test('should create an OptionItem with a label and value', () {
      final optionItem = OptionItem(label: 'LabelA', value: 1, id: "labelA");

      expect(optionItem.label, 'Label');
      expect(optionItem.value, 1);
    });

    test('should convert OptionItem to a string', () {
      final optionItem = OptionItem(label: 'LabelB', value: 1, id: "labelB");

      expect(optionItem.toString(), 'Instance of OptionItem(name:Label, value:1)');
    });
  });
}
