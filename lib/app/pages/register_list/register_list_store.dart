import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';
import 'package:tally_counter/app/core/domain/repositories/date_register_repository.dart';
import 'package:tally_counter/app/core/infra/providers/file_save_provider.dart';
import 'package:tally_counter/app/core/infra/utils/csv_builder.dart';
import 'package:tally_counter/app/core/infra/utils/tally_register_exporter.dart';

class RegisterListStore {
  final CounterRegisterRepository _repository;
  final DateRegisterRepository _dateRepository;

  RegisterListStore([CounterRegisterRepository? repository])
      : _repository = repository ?? Modular.get<CounterRegisterRepository>(),
        _dateRepository = Modular.get<DateRegisterRepository>();

  Future<List<CounterRegister>> load([DateTime? fromDate]) {
    if (fromDate != null) {
      return _repository.load(fromDate);
    }
    return _repository.loadAll();
  }

  Future<List<DateTime>> loadAllDates() {
    return _dateRepository.loadAll();
  }

  Future<bool> delete(CounterRegister register) {
    return _repository.delete(register);
  }

  Future<bool> exportCSV(DateTime fromDate, [DateTime? toDate]) async {
    final csvBuilder = CSVBuilder();
    final fileData = csvBuilder.build(
      TallyRegisterExporter.call(await load(fromDate)),
    );

    print(String.fromCharCodes(fileData));
    final dateFormatter = intl.DateFormat.yMd();
    final result = await FileSaveProvider.writeToFile(
      'date_export#${dateFormatter.format(fromDate).replaceAll("/", "-")}.csv',
      fileData,
    );
    print(result);
    return result;
  }
}
