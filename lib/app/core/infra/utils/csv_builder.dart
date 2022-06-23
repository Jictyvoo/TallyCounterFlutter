import 'dart:typed_data';

class CSVBuilder {
  final StringBuffer _buffer;
  final String delimiter;

  CSVBuilder([this.delimiter = ';']) : _buffer = StringBuffer();

  Uint8List build(List<Map<String, String>> target) {
    _buffer.clear();

    final allKeys = target.isNotEmpty ? target.first.keys.toList() : <String>[];
    for (final key in allKeys) {
      _buffer.write('"$key"$delimiter');
    }
    _buffer.write('\n');
    for (final element in target) {
      _buildLine(element, allKeys);
    }

    return Uint8List.fromList(_buffer.toString().codeUnits);
  }

  void _buildLine(Map<String, String> element, List<String> keys) {
    // Improve to have the possibility to update
    // the keys if the element has more keys
    for (final key in keys) {
      _buffer.write('"${element[key] ?? ''}"$delimiter');
    }
    _buffer.write('\n');
  }
}
