import 'dart:typed_data';

class VersionLabel {
  static final zeroCharCode = '0'.codeUnitAt(0);
  static final dotCharCode = '.'.codeUnitAt(0);

  final int major;
  final int minor;
  final int patch;

  const VersionLabel({this.major = 1, this.minor = 0, this.patch = 0});

  factory VersionLabel.fromString(String number) {
    var version = Uint8List(3);
    var currentNumber = 0;
    var numberIndex = 0;

    final codeUnits = number.codeUnits;
    for (var index = 0; index < codeUnits.length; index++) {
      final character = codeUnits[index];
      if (index > 0 && character == dotCharCode) {
        if (numberIndex >= version.length) {
          numberIndex = version.length - 1;
          currentNumber =
              (version[numberIndex] * 10) + character - zeroCharCode;
        }
        version[numberIndex] = currentNumber;
        numberIndex += 1;
        currentNumber = 0;
      } else if (!(index == 0 && character == 'v'.codeUnitAt(0))) {
        currentNumber = (currentNumber * 10) + character - zeroCharCode;
      }
    }
    if (numberIndex < version.length) {
      version[numberIndex] = currentNumber;
    }

    return VersionLabel(
      major: version[0],
      minor: version[1],
      patch: version[2],
    );
  }

  int compare(VersionLabel other) {
    final sArr = asArray();
    final oArr = other.asArray();

    for (var index = 0; index < sArr.length; index++) {
      if (sArr[index] > oArr[index]) {
        return 1;
      }
      if (sArr[index] < oArr[index]) {
        return -1;
      }
    }

    return 0;
  }

  Uint8List asArray() {
    return Uint8List.fromList([major, minor, patch]);
  }

  @override
  String toString() {
    return "v$major.$minor.$patch";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionLabel &&
          runtimeType == other.runtimeType &&
          major == other.major &&
          minor == other.minor &&
          patch == other.patch;

  bool operator >(Object other) => other is VersionLabel && compare(other) > 0;

  bool operator >=(Object other) =>
      other is VersionLabel && compare(other) >= 0;

  bool operator <(Object other) => other is VersionLabel && compare(other) < 0;

  bool operator <=(Object other) =>
      other is VersionLabel && compare(other) <= 0;

  VersionLabel operator +(Object other) {
    if (other is double) {
      if (other < 0.1) {
        return VersionLabel(
          major: major,
          minor: minor,
          patch: patch + (other * 100).toInt(),
        );
      } else if (other < 1) {
        return VersionLabel(
          major: major,
          minor: minor + (other * 10).toInt(),
          patch: patch,
        );
      } else {
        return VersionLabel(
          major: major + other.toInt(),
          minor: minor,
          patch: patch,
        );
      }
    }
    return this;
  }

  @override
  int get hashCode => major.hashCode ^ minor.hashCode ^ patch.hashCode;
}
