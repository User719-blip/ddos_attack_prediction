class AttackEvent {
  final int attack;
  final double? lat;
  final double? lon;
  final String? city;
  final String? country;
  final String timestamp;

  AttackEvent({
    required this.attack,
    this.lat,
    this.lon,
    this.city,
    this.country,
    required this.timestamp,
  });

  factory AttackEvent.fromJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};
    return AttackEvent(
      attack: json['attack'],
      lat: (location['lat'] as num?)?.toDouble(),
      lon: (location['lon'] as num?)?.toDouble(),
      city: location['city'],
      country: location['country'],
      timestamp: json['timestamp'] ?? '',
    );
  }
}