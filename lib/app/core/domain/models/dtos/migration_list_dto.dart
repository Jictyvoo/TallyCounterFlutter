class MigrationInfoDTO {
  final int id;
  final String name;
  final String description;
  final int _millisecondsSinceEpoch;

  const MigrationInfoDTO({
    this.id = 0,
    required this.name,
    this.description = '',
    int timestamp = 0,
  }) : _millisecondsSinceEpoch = timestamp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MigrationInfoDTO &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  DateTime get timestamp {
    return DateTime.fromMillisecondsSinceEpoch(_millisecondsSinceEpoch);
  }
}

class MigrationListDTO {
  final Set<MigrationInfoDTO> migrations;

  const MigrationListDTO({
    required this.migrations,
  });

  bool hasMigration(String name) {
    return migrations.contains(MigrationInfoDTO(name: name, id: 0));
  }

  MigrationInfoDTO getMigration(String name) {
    return migrations.firstWhere(
      (migration) => migration.name == name,
      orElse: () => const MigrationInfoDTO(id: 0, name: ''),
    );
  }

  DateTime getTimestamp(String name) {
    return getMigration(name).timestamp;
  }
}
