class RegisterPurpose {
  final int? id;
  final String name;
  final String description;
  final Duration? limit;

  static const empty = RegisterPurpose(
    id: null,
    name: '',
    description: '',
    limit: null,
  );

  const RegisterPurpose({
    this.id,
    required this.name,
    this.description = '',
    this.limit,
  });
}
