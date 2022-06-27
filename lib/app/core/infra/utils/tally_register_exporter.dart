import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

abstract class TallyRegisterExporter {
  static List<Map<String, String>> call(List<CounterRegister> tallyRegisters) {
    final result = <Map<String, String>>[];
    for (final register in tallyRegisters) {
      result.add(<String, String>{
        'start-time': register.startTime.toString(),
        'end-time': register.endTime.toString(),
        'new-value': register.newValue.toString(),
        'old-value': register.oldValue.toString(),
        'duration': register.duration.toString(),
        'purpose': register.purpose.name,
      });
    }

    return result;
  }
}
