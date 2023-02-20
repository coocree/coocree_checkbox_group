import 'package:coocree_radio_group/package.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OptionItem', () {
    test('should create an OptionItem with a label and value', () {
      final optionItem = OptionItem(label: 'Label', value: 1);

      expect(optionItem.label, 'Label');
      expect(optionItem.value, 1);
    });

    test('should convert OptionItem to a string', () {
      final optionItem = OptionItem(label: 'Label', value: 1);

      expect(optionItem.toString(), 'Instance of OptionItem(name:Label, value:1)');
    });
  });
}
