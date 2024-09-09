class AccountAttribute{
  String key;
  String value;
  bool isSensitive;
  AccountAttribute({
    required this.key,
    required this.value,
    this.isSensitive = false,
  });

  factory AccountAttribute.fromMap(Map<String, dynamic> data) => AccountAttribute(
    key: data['key'] as String,
    value: data['value'] as String,
    isSensitive: data['isSensitive'] as bool,
  );

  Map<String, dynamic> toMap() => {
    'key': key,
    'value': value,
    'isSensitive': isSensitive,
  };
}