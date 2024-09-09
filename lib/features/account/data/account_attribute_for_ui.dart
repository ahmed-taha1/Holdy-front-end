class AccountAttributeForUi{
  final String key;
  final String value;
  bool isHidden;

  AccountAttributeForUi({
    required this.key,
    required this.value,
    this.isHidden = true,
  });
}