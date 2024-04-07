class UpdatePlatformDto{
  final int platformId;
  final String platformName;
  final String iconColor;

  UpdatePlatformDto({
    required this.platformId,
    required this.platformName,
    required this.iconColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': platformId,
      'platformName': platformName,
      'iconColor': iconColor,
    };
  }
}